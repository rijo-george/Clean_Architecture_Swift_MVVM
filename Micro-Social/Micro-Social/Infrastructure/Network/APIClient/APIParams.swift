
import Alamofire

enum APIParameterKey{
    struct Login {
        static let password = "password"
        static let email = "email"
    }
}

enum APIParameters{
    static func params(route:APIRoute) -> Parameters?{
        switch route {
        case .login(let email, let password):
            return [APIParameterKey.Login.email: email, APIParameterKey.Login.password: password]
        default:
            return nil
        }
    }
}
