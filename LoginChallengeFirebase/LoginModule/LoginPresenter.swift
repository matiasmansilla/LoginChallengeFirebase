//
//  LoginPresenter.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import Foundation

/// Login Module Presenter
class LoginPresenter: LoginPresenterProtocol {

    //MARK: - Properties
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    //MARK: - Methods
    func loginWithFacebook() {
        interactor?.loginFacebook(from: view)
    }
    
    func goToRegister() {
        router?.goToRegister()
    }
    
    func loginFacebookFailed(with title: String?, error message: String?) {
        router?.presentError(from: view, with: title, message: message)
    }
}

