//
//  LoginContracts.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import Foundation

//MARK: Presenter -
/// Login Module Presenter Protocol
protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var router: LoginRouterProtocol? { get set }
    func loginWithFacebook()
    func loginFacebookFailed(with title: String?, error message: String?)
    func goToRegister()
    func cancelLogin()
}

//MARK: View -
/// Login Module View Protocol
protocol LoginViewProtocol: AnyObject {
    var presenter: LoginPresenterProtocol? { get set }
}

//MARK: Interactor -
/// Login Module Interactor Protocol
protocol LoginInteractorProtocol: AnyObject {
    var presenter: LoginPresenterProtocol? { get set }
    func loginFacebook(from context: AnyObject?)
    
}

//MARK: Router -
/// Login Module Router Protocol
protocol LoginRouterProtocol: AnyObject {
    ///Optional
//    func navigateToLogin(from context: AnyObject?)
    func goToLogin()
    func goToRegister(from context: AnyObject?)
    func presentError(from context: AnyObject?, with title: String?, message: String?)
    func dismissLogin(from context: AnyObject?)
}
