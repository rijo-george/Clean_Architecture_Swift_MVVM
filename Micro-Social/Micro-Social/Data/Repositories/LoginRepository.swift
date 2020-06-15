//
//  UserAuthenticationRepository.swift
//  Skelton_App_Swift
//
//  Created by Rijo George on 07/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

struct LoginRepository: LoginRepositoryAPI{
    let datasource:LoginDatasourceAPI
    
    init(datasource:LoginDatasourceAPI) {
        self.datasource = datasource
    }
    
    func loginUser(request: LoginUsingEmailRequest,
                   completion: @escaping (User?, Error?) -> Void) {
        datasource.loginUser(request: request.dictionary) { (response, error) in
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
