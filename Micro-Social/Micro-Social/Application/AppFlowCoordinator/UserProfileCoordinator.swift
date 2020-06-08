//
//  UserProfileCoordinator.swift
//  Coordinator
//
//  Created by Rijo George on 16/03/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import UIKit


protocol UserProfileCoordinatorProtocol:Coordinator {
    func didFinishShowingProfile()
    func showUserActivities()
    func showUserHikes()
    func showUserConnections()
}

class UserProfileCoordinator: UserProfileCoordinatorProtocol {
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: OnboardingCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        let vc = ProfileViewController.instantiate()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
    }
    
    func showUserActivities(){
//        let vc = UserActivitiesViewController.instantiate()
//        navigationController.pushViewController(vc, animated: true)
    }
    
    func showUserHikes(){
//        let vc = UserHikesViewController.instantiate()
//        navigationController.pushViewController(vc, animated: true)
    }
    
    func showUserConnections(){
//        let vc = UserConnectionsViewController.instantiate()
//        navigationController.pushViewController(vc, animated: true)
    }
    func didFinishShowingProfile() {
        parentCoordinator?.childDidFinish(self)
    }
}
