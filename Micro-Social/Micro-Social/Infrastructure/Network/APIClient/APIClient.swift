
import Alamofire

class BaseClient {
    @discardableResult
    static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
                completion(response.result)
        }
    }
}

class APIClient: BaseClient{
    static func getCaches(route:APIRoute, completion:@escaping (AFResult<HomeModel>)->Void) {
        APIClient.performRequest(route: APIRouter(route: route), completion: completion)
    }
}
