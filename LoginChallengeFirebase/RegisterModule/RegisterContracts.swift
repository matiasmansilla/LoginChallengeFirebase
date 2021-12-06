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
    func save(user: User)
    func setError(title: String?, message: String?)
    func goToHome()
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
    func saveInDB(user: User)
}

//MARK: Router -
/// Register Module Router Protocol
protocol RegisterRouterProtocol: AnyObject {
    func goToRegister()
    func goToHome(from context: AnyObject?)
    func presentError(from context: AnyObject?, with title: String?, message: String?)
}
