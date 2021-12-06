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
        ///Connections
        view.presenter = presenter
        presenter?.view = view
        presenter?.router = self
        presenter?.interactor = interactor
        interactor?.presenter = presenter
        return view
    }
    
    func goToHome() {
        let view = instantiate()
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        window.rootViewController = view
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: nil)
    }
    
    func goToLogin() {
        MainWireframe.goToFirstScreen()
    }
    
}
