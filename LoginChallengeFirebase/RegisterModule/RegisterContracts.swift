//
//  RegisterContracts.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 05/12/2021.
//

import UIKit

//MARK: Presenter -
/// Register Module Presenter Protocol
protocol RegisterPresenterProtocol: AnyObject {
    var view: RegisterViewProtocol? { get set }
    var interactor: RegisterInteractorProtocol? { get set }
    var router: RegisterRouterProtocol? { get set }
}

//MARK: View -
/// Register Module View Protocol
protocol RegisterViewProtocol: AnyObject {
    var presenter: RegisterPresenterProtocol? { get set }
}

//MARK: Interactor -
/// Register Module Interactor Protocol
protocol RegisterInteractorProtocol: AnyObject {
    var presenter: RegisterPresenterProtocol? { get set }
}

//MARK: Router -
/// Register Module Router Protocol
protocol RegisterRouterProtocol: AnyObject {
    func goToRegister()
    func goToHome()
}
