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
}

//MARK: View -
/// Home Module View Protocol
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
}

//MARK: Interactor -
/// Home Module Interactor Protocol
protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
}

//MARK: Router -
/// Home Module Router Protocol
protocol HomeRouterProtocol: AnyObject {
    ///Optional
//    func navigateToHome(from context: AnyObject?)
}
