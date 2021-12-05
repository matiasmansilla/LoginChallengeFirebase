//
//  LoginViewController.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    
    //MARK: - Properties
    var presenter: LoginPresenterProtocol?
    
    //MARK: - Initializer
    static func instantiate() -> LoginViewController {
      let storyboard = UIStoryboard(name: "LoginViewController", bundle: .main)
      if let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
        return viewController
      } else {
        return LoginViewController()
      }
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
