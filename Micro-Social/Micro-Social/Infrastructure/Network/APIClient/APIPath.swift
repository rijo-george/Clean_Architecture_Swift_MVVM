import Alamofire

enum APIPath{
    static func path(route:APIRoute) -> String{
        switch route {
        case .login:
            return "/login"
        case .profiles:
            return "/18of5g"
        case .article(let id):
            return "/article/\(id)"
        case .cacheListByLocation(let latitude, let longitude, let radius):
            return "/caches?lat=\(latitude)&lon=\(longitude)&radius:\(radius)"
        case .cacheListByPlaceId:
            return ""
        }
    }
}
