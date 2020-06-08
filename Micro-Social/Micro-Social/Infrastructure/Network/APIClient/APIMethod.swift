import Alamofire

enum APIMethod{
    static func type(route:APIRoute) -> HTTPMethod{
        switch route {
        case .login:
            return .post
        default:
            return .get
        }
    }
}
