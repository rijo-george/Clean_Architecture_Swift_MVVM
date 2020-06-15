//
//  GetEventResponse.swift
//  MvvmExampleSwift5.0
//
//  Created by Bekir on 14.01.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation

public class LoginDTO:Codable{
    var id : String?
    var name : String?
    var imageUrl : String?
    var token : String?
    
    enum CodingKeys: String, CodingKey {
          case token = "token"
    }
 }

extension LoginDTO{
    func toDomain() -> User?{
        guard let id = id, let name = name, let token = token, let imageUrl = imageUrl else{
            return nil
        }
        return .init(id: id, name: name, imageUrl: imageUrl, token: token)
    }
}
