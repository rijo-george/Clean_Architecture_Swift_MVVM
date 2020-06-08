//
//  UserAuthenticationRepository.swift
//  Skelton_App_Swift
//
//  Created by Rijo George on 07/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

struct LoginRepository: LoginRepositoryAPI{
    func loginUser(request: LoginUsingEmailRequest,
                   completion: @escaping (User?, Error?) -> Void) {
        LoginServices.loginUsingEmail(params: request.dictionary) { (response, error) in
            if let error = error {
                completion(nil,error)
                return
            }
            let user = response?.toDomain()
            completion(user, nil)
        }
    }
    
    func loginUser(request: LoginUsingPhoneRequest,
                   completion: @escaping (User?, Error?) -> Void) {
        
    }
}
