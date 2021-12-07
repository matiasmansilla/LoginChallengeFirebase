//
//  HomePresenter.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import Foundation

/// Home Module Presenter
class HomePresenter: HomePresenterProtocol {

    //MARK: - Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    var email: String
    
    internal init(email: String) {
        self.email = email
    }
    
    func logout() {
        interactor?.logoutAndCleanSession()
    }
    
    func navigateToLogin() {
        router?.goToLogin()
    }
    
    func getEmail() {
        view?.refresh(name: email)
    }
    
    func logoutFailed(with title: String?, error message: String?) {
        router?.presentError(from: view, with: title, message: message)
    }
    
}

