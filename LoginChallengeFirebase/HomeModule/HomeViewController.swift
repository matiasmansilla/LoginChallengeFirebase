//
//  HomeViewController.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    
    //MARK: - Properties
    var presenter: HomePresenterProtocol?
    
    //MARK: - Initializer
    static func instantiate() -> HomeViewController {
      let storyboard = UIStoryboard(name: "HomeViewController", bundle: .main)
      if let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
        return viewController
      } else {
        return HomeViewController()
      }
    }
}
