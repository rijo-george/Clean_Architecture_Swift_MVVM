//
//  LoginUserUsecase.swift
//  Skelton_App_Swift
//
//  Created by Rijo George on 07/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

protocol LoginUserUsecaseAPI {
    func execute(request: LoginUsingEmailRequest,
                 completion:  @escaping (User?, Error?) -> Void)
    func execute(request: LoginUsingPhoneRequest,
                 completion:  @escaping (User?, Error?) -> Void)
}


final class LoginUseUsercase: LoginUserUsecaseAPI{
    let repository: UserAuthenticationRepositoryAPI
    
    init(repository: UserAuthenticationRepositoryAPI) {
        self.repository = repository
    }
    
    func execute(request: LoginUsingEmailRequest, completion: @escaping (User?, Error?) -> Void) {
        self.repository.loginUser(request: request) { (user,error) in
            completion(user,error)
        }
    }
    
    func execute(request: LoginUsingPhoneRequest, completion: @escaping (User?, Error?) -> Void) {
        self.repository.loginUser(request: request) { (user,error) in
            completion(user,error)
        }
    }
}
