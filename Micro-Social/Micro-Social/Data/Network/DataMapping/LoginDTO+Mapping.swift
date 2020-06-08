//
//  GetEventResponse.swift
//  MvvmExampleSwift5.0
//
//  Created by Bekir on 14.01.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation

public class LoginDTO:Codable{
    var token : String?
    
    enum CodingKeys: String, CodingKey {
          case token = "token"
    }
 }

extension LoginDTO{
    func toDomain() -> User{
        return .init(id: "1", name: "Rijo", imageUrl: "\(token ?? "no token")")
    }
}
