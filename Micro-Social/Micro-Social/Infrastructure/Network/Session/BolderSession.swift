
import Foundation
import Alamofire

struct Credentials{
    let accessToken:String
    let refreshToken:String
    let revokeToken:String
}

class BolderSession {
    private static let sessionHandler = SessionHandler()
    static let manager = Session(interceptor: BolderSession.sessionHandler)
    
    class func configure(with credentials:Credentials) {
        sessionHandler.configure(with:credentials)
    }
}
