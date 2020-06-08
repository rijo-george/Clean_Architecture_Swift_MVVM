//
//  UserAuthenticationRepositoryAPI.swift
//  Skelton_App_Swift
//
//  Created by Rijo George on 07/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

protocol UserAuthenticationRepositoryAPI{
    func loginUser(request: LoginUsingEmailRequest,
                   completion: @escaping (User?, Error?) -> Void)
    func loginUser(request: LoginUsingPhoneRequest,
                   completion: @escaping (User?, Error?) -> Void)
}
