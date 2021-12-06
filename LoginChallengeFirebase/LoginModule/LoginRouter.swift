//
//  LoginRouter.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit

/// Login Module Router (aka: Wireframe)
class LoginRouter: LoginRouterProtocol {
    
    func instantiate() -> LoginViewController {
        let view = LoginViewController.instantiate()
        let presenter: LoginPresenterProtocol? = LoginPresenter()
        let interactor: LoginInteractorProtocol? = LoginInteractor()
//        let apiDataManager: LoginAPIDataManagerProtocol = LoginAPIDataManager()
        ///Connections
        view.presenter = presenter
        presenter?.view = view
        presenter?.router = self
        presenter?.interactor = interactor
        interactor?.presenter = presenter
//        interactor.apiDataManager = apiDataManager
        return view
    }
    
    func goToLogin() {
        let view = instantiate()
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        window.rootViewController = view
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: nil)
    }
    
    func goToRegister() {
        RegisterRouter().goToRegister()
    }
    
    func presentError(from context: AnyObject?, with title: String?, message: String?) {
        GenericErrorRouter().showGenericError(from: context, title: title, message: message, dismissHandler: nil)
    }
    
    
}
