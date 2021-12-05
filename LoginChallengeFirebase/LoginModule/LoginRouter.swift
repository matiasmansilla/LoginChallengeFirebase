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
}
