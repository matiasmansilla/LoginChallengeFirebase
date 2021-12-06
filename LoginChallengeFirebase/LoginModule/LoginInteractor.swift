//
//  LoginInteractor.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth

/// Login Module Interactor
class LoginInteractor: LoginInteractorProtocol {
    
    
    //MARK: - Properties
    weak var presenter: LoginPresenterProtocol?
    private let loginFacebookManager = LoginManager()
    
    //MARK: - Methods
    func loginFacebook(from context: AnyObject?) {
        guard let context = context as? UIViewController else { return }
        loginFacebookManager.logOut()
        loginFacebookManager.logIn(permissions: [.email], viewController: context) { [weak self] (result) in
            switch result {
            case .success(granted: _, declined: _, token: let token):
                let credential = FacebookAuthProvider.credential(withAccessToken: token?.tokenString ?? "")
                Auth.auth().signIn(with: credential) { [weak self] (result, error) in
                    if let result = result {
                        SessionHelper.shared.saveSession()
                        self?.presenter?.goToRegister()
                    } else {
                        self?.presenter?.loginFacebookFailed(with: "Error", error: error?.localizedDescription)
                    }
                }
                
            case .cancelled:
                break
            case .failed(_):
                //Handle error
            print("error")
            @unknown default:
                break
            }
        }
        
    }

}
