//
//  RegisterRouter.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 05/12/2021.
//

import UIKit

/// Register Module Router (aka: Wireframe)
class RegisterRouter: RegisterRouterProtocol {
    
    func instantiate() -> RegisterViewController {
        let view = RegisterViewController.instantiate()
        let presenter: RegisterPresenterProtocol? = RegisterPresenter()
        let interactor: RegisterInteractorProtocol? = RegisterInteractor()
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
    
    func goToRegister() {
        let view = instantiate()
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        window.rootViewController = view
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: nil)
    }
    
    func goToHome(from context: AnyObject?) {
        guard let context = context as? UIViewController else { return }
        context.hideLoadingOverlay()
        MainWireframe.goToFirstScreen()
    }
    
    func presentError(from context: AnyObject?, with title: String?, message: String?) {
        guard let context = context as? UIViewController else { return }
        GenericErrorRouter().showGenericError(from: context, title: title, message: message) {
          context.hideLoadingOverlay()
        }
    }
    
}
