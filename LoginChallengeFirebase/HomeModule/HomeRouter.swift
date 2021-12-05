//
//  HomeRouter.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit

/// Home Module Router (aka: Wireframe)
class HomeRouter: HomeRouterProtocol {
    func instantiate() -> HomeViewController {
        let view = HomeViewController.instantiate()
        let presenter: HomePresenterProtocol? = HomePresenter()
        let interactor: HomeInteractorProtocol? = HomeInteractor()
//        let apiDataManager: LoginAPIDataManagerProtocol = LoginAPIDataManager()
        ///Connections
        view.presenter = presenter
        presenter?.view = view
        presenter?.router = self
        presenter?.interactor = interactor
        interactor?.presenter = presenter
//        interactor.apiDataManager = apiDataManager
        return view
    }
}
