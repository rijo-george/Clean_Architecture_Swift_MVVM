//
//  UserAuthenticationServices.swift
//  Micro-Social
//
//  Created by Rijo George on 08/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

class LoginServices: NetworkService{
    
    static func loginUsingEmail(params:[String:Any]?, completion:@escaping(_ result:LoginDTO?,_ error:Error?) -> Void){
        let url = "https://reqres.in/api/login"
        self.sendApiRequest(method:.post, url: url, parameters: params, completion: completion)
    }
}
