
import Foundation
import Alamofire

class SessionHandler: RequestInterceptor {
    
    private var refreshUrl = "/bauth/token/refresh"
    private let refreshTokenSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        return Session(configuration: configuration)
    }()
    private let lock = NSLock()
    private var accessToken: String?
    private var refreshToken: String?
    private var revokeToken: String?
    private var isRefreshing = false
    private var requestsToRetry: [(RetryResult) -> Void] = []
    
    func configure(with credentials:Credentials) {
        accessToken = credentials.accessToken
        refreshToken = credentials.refreshToken
        revokeToken = credentials.revokeToken
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard let accessToken = accessToken else {
            completion(Result.success(urlRequest))
            return
        }
        var request = urlRequest
        request.setValue("JWT " + accessToken, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue(Configurations.remote.creationSpace.id, forHTTPHeaderField: "Bolder-Context")
        completion(Result.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        lock.lock() ; defer { lock.unlock() }
        guard let refreshToken = refreshToken, let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(RetryResult.doNotRetryWithError(error))
            return
        }
        requestsToRetry.append(completion)
        refreshTokens(refreshToken: refreshToken) { [weak self] accessToken in
            guard let strongSelf = self else { return }
            strongSelf.processTokenResponse(accessToken: accessToken, error: error)
        }
    }
    
    private func processTokenResponse(accessToken: String?, error:Error) {
        lock.lock() ; defer { lock.unlock() }
        if let accessToken = accessToken {
            self.accessToken = accessToken
            Token.accessToken = accessToken
            requestsToRetry.forEach { $0(RetryResult.retry) }
        } else {
            requestsToRetry.forEach { $0(RetryResult.doNotRetryWithError(error)) }
        }
        requestsToRetry.removeAll()
    }
    
    private func refreshTokens(refreshToken:String, completion: @escaping (_ accessToken: String?) -> Void) {
        guard !isRefreshing else { return }
        isRefreshing = true
        let parameters: [String: Any] = [
            "refreshToken": refreshToken,
        ]
        refreshTokenSession.request(refreshUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { [weak self] response in
                guard let strongSelf = self else { return }
                if
                    let json = response.value as? [String: Any],
                    let accessToken = (json["data"] as? [String: Any])?["token"] as? String
                {
                    completion(accessToken)
                } else {
                    completion(nil)
                }
                strongSelf.isRefreshing = false
        }
    }
}

