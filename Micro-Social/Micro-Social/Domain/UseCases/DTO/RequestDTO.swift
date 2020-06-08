import Foundation

public struct LoginUsingEmailRequest: Codable  {
    let email: String
    let password: String
}

public struct LoginUsingPhoneRequest: Codable {
    let phoneNumber: String
}
