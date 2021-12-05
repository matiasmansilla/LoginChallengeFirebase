//
//  LoginContracts.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit

//MARK: Presenter -
/// Login Module Presenter Protocol
protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var router: LoginRouterProtocol? { get set }
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
}

//MARK: Router -
/// Login Module Router Protocol
protocol LoginRouterProtocol: AnyObject {
    ///Optional
//    func navigateToLogin(from context: AnyObject?)
}
