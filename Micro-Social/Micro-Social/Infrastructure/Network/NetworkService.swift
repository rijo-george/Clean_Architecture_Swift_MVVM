
import Alamofire

typealias completionBlock = (_ response: AFDataResponse<Any>?) -> Void
typealias downloadProgressBlock = (_ response: Progress) -> Void
typealias downloadCompletionBlock = (_ response: AFDownloadResponse<URL?>?) -> Void

class NetworkService: NSObject {
    static let logNetworkCallsToConsole = false
    static let clearAllCachedResponse = false
    
    static func sendApiRequest<T:Decodable>(method:HTTPMethod, url:String, parameters:[String:Any?]?, completion: @escaping(_ result: T?, _ error: Error?) -> Void) {
        apiRequest(url: url, method: method, parameters: parameters) { (response:AFDataResponse<Any>?) in
            if let error = response?.error {
                completion(nil, error)
                return()
            }
            if let progressData = response?.data {
                do {
                    let decodedValue = try JSONDecoder().decode(T.self, from: progressData)
                    completion(decodedValue, nil)
                } catch {
                    if self.logNetworkCallsToConsole {
                        print(error)
                    }
                }
            }
        }
    }
    
    static func apiRequest(url:String, method:HTTPMethod, parameters:[String:Any?]?, encoding: ParameterEncoding = JSONEncoding.default, completion:@escaping completionBlock) {
        BolderSession.manager.request(url, method:method, parameters:preprocessParameters(parameters), encoding:encoding).validate().responseJSON { (sessionData) in
            
            completion(sessionData)
        }
    }
    
    private static func preprocessParameters(_ parameters:[String:Any?]?) -> Parameters? {
        if let parameters = parameters {
            // Alamofire safely unpacks optionals, so its ok to cast Any? to Any
            // Alamofire does not ignore nils, but sends them as null
            return parameters as Parameters
        }
        return nil
    }
}
