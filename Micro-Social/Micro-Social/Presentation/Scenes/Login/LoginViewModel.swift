//
//  LoginViewModel.swift
//  Skelton_App_Swift
//
//  Created by Rijo George on 07/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

protocol LoginViewModelInput {
    func loginUser(email: String, password: String)
}

protocol LoginViewModelOutput {
    var isRefreshing: ((Bool) -> Void)? {get set}
    var loginSucceeded: ((User) -> Void)? {get set}
    var loginFailed: ((String) -> Void)? {get set}
}

protocol LoginViewModelAPI: LoginViewModelInput, LoginViewModelOutput { }

class LoginViewModel: LoginViewModelAPI {
    var isRefreshing: ((Bool) -> Void)?
    var loginSucceeded: ((User) -> Void)?
    var loginFailed: ((String) -> Void)?
    var loginUseCase: LoginUserUsecaseAPI!
    
    init(loginUseCase: LoginUserUsecaseAPI) {
        self.loginUseCase = loginUseCase
    }
}

extension LoginViewModel {
    func loginUser(email: String, password: String) {
        self.isRefreshing?(true)
        let request = LoginUsingEmailRequest(email: email, password: password)
        self.loginUseCase.execute(request: request) { (user,error) in
            self.isRefreshing?(false)
            if let error = error{
                self.loginFailed?(error.localizedDescription)
                return
            }
            guard let user = user else{
                self.loginFailed?("Some error occured")
                return
            }
            self.loginSucceeded?(user)
        }
    }
}
