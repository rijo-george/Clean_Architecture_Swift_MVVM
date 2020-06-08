//
//  LoginViewController.swift
//  Skelton_App_Swift
//
//  Created by Rijo George on 07/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    private var viewModel: LoginViewModelAPI!
    static func create(with viewModel: LoginViewModelAPI) -> LoginViewController{
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewControllerIdentifier") as! LoginViewController
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        loginUser()
    }
    
    func bindViewModel() {
        viewModel.isRefreshing = { isRefreshing in
            print("is refreshing: \(isRefreshing)")
        }
        
        viewModel.loginSucceeded = { user in
            print(user.imageUrl)
            print(user.name)
        }
        
        viewModel.loginFailed = { error in
            print( error)
        }
    }
    
    func loginUser(){
        viewModel.loginUser(email: "eve.holt@reqres.in", password: "cityslicka")
    }
}
