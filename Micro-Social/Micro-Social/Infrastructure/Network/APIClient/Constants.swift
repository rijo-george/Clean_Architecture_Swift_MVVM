
import Foundation

enum API {
    struct ProductionServer {
        static let baseURL = "https://api.myjson.com/bins/"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
