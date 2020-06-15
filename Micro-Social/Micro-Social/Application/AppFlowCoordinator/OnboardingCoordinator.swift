
import UIKit

class OnboardingCoordinator:  NSObject, Coordinator, UINavigationControllerDelegate  {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        navigationController.navigationBar.isHidden = true
        let datasource = LoginDatasource()
        let repository = LoginRepository(datasource: datasource)
        let usecase = LoginUsecase(repository: repository)
        let viewModel = LoginViewModel(loginUseCase: usecase)
        let viewController =  LoginViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showProfile(){
//        let child = UserProfileCoordinator(navigationController: navigationController)
//        child.parentCoordinator = self
//        child.start()
//        childCoordinators.append(child)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

//        if let profileViewController = fromViewController as? ProfileViewController {
//            childDidFinish(profileViewController.coordinator)
//        }
    }
}
