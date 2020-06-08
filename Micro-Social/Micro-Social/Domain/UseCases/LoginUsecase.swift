import Foundation

protocol LoginUseCaseAPI {
    func execute(request: LoginUsingEmailRequest,
                 completion:  @escaping (User?, Error?) -> Void)
    func execute(request: LoginUsingPhoneRequest,
                 completion:  @escaping (User?, Error?) -> Void)
}

final class LoginUsecase: LoginUseCaseAPI{
    let repository: LoginRepositoryAPI
    
    init(repository: LoginRepositoryAPI) {
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
