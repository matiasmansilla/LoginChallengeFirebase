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
    
}

