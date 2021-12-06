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
    
}

