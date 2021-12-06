//
//  RegisterPresenter.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 05/12/2021.
//

import Foundation

/// Register Module Presenter
class RegisterPresenter: RegisterPresenterProtocol {
    
    //MARK: - Properties
    weak var view: RegisterViewProtocol?
    var interactor: RegisterInteractorProtocol?
    var router: RegisterRouterProtocol?
    
    //MARK: - Methods
    func save(user: User) {
        interactor?.saveInDB(user: user)
    }
    
    func setError(title: String?, message: String?) {
        router?.presentError(from: view, with: title, message: message)
    }
    
    func goToHome() {
        router?.goToHome(from: view)
    }
}

