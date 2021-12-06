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
    func navigateToLogin()
    func observeData()
    func updateView(with name: String)
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
    func observeData()
}

//MARK: Router -
/// Home Module Router Protocol
protocol HomeRouterProtocol: AnyObject {
    ///Optional
//    func navigateToHome(from context: AnyObject?)
    func goToHome(email: String)
    func goToLogin()
}
