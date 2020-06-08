import SAMKeychain

class Keychain{
    private static let key =  "Bolder_KEY"
    class func getPassword(for service:String) -> String?{
        return SAMKeychain.password(forService: service, account:key, error:nil)
    }
    
    class func set(password:String?, for service:String){
        guard let newPassword = password else{
            Keychain.deletePassword(for: service)
            return
        }
        SAMKeychain.setPassword(newPassword, forService: service, account: key)
    }
    
    class func deletePassword(for service:String){
         SAMKeychain.deletePassword(forService: service, account: key)
    }
}
