//
//  HomeContracts.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit

//MARK: Presenter -
/// Home Module Presenter Protocol
protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func getEmail()
    func logout()
    func logoutFailed(with title: String?, error message: String?)
    func navigateToLogin()
}

//MARK: View -
/// Home Module View Protocol
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func refresh(name value: String)
}

//MARK: Interactor -
/// Home Module Interactor Protocol
protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func logoutAndCleanSession()
}

//MARK: Router -
/// Home Module Router Protocol
protocol HomeRouterProtocol: AnyObject {
    func goToHome(email: String)
    func goToLogin()
    func presentError(from context: AnyObject?, with title: String?, message: String?)
}
