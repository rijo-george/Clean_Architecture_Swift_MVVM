//
//  UserAuthenticationServices.swift
//  Micro-Social
//
//  Created by Rijo George on 08/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

protocol LoginDatasourceAPI{
    func loginUser(request: [String:Any]?,
                          completion: @escaping (LoginDTO?, Error?) -> Void)
}

class LoginDatasource: LoginDatasourceAPI{
    func loginUser(request:[String:Any]?, completion: @escaping (LoginDTO?, Error?) -> Void) {
        let url = "https://reqres.in/api/login"
        NetworkService.sendApiRequest(method:.post, url: url, parameters: request, completion: completion)
    }
}
