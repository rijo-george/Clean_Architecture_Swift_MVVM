
import Alamofire

struct APIRouter: URLRequestConvertible {
    var route:APIRoute
    
    private var method: HTTPMethod {
        return APIMethod.type(route: route)
    }
    
    private var path: String {
        return APIPath.path(route: route)
    }
    
    private var parameters: Parameters? {
        return APIParameters.params(route: route)
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try API.ProductionServer.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

