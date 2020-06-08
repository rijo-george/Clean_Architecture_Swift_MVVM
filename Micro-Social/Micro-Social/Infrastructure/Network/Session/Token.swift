import Foundation

class Token{
    static var accessToken:String? {
        get {
            return Keychain.getPassword(for: "token")
        }
        set {
            Keychain.set(password: newValue, for: "token")
        }
    }
    static var refreshToken:String?{
        get {
            return Keychain.getPassword(for: "refreshToken")
        }
        set {
            Keychain.set(password: newValue, for: "refreshToken")
        }
    }
    static var revokeToken:String?{
        get {
            return Keychain.getPassword(for: "revokeToken")
        }
        set {
            Keychain.set(password: newValue, for: "revokeToken")
        }
    }
    class func removeAllTokens(){
        Token.accessToken = nil
        Token.refreshToken = nil
        Token.revokeToken = nil
    }
}
