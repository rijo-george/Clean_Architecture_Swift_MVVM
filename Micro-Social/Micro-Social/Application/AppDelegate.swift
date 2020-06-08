//
//  AppDelegate.swift
//  Skelton_App_Swift
//
//  Created by Rijo George on 07/06/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        window?.rootViewController = initialViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    private func initialViewController() -> LoginViewController {
        let repository = UserAuthenticationRepository()
        let usecase = LoginUseUsercase(repository: repository)
        let viewModel = LoginViewModel(loginUseCase: usecase)
        let view = LoginViewController.create(with: viewModel)
        return view
    }

}

