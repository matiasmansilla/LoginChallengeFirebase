//
//  HomePresenter.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import Foundation

/// Home Module Presenter
class HomePresenter: HomePresenterProtocol {
    
    //MARK: - Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
}

