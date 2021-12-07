//
//  HomeInteractor.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit
import FirebaseDatabase
import FBSDKLoginKit
import FirebaseAuth

/// Home Module Interactor
class HomeInteractor: HomeInteractorProtocol {

    //MARK: - Properties
    weak var presenter: HomePresenterProtocol?
    private var ref: DatabaseReference? = Database.database().reference()
    private let loginFacebookManager = LoginManager()
    
    //MARK: - Methods
    func logoutAndCleanSession() {
        loginFacebookManager.logOut()
        do {
            try Auth.auth().signOut()
            SessionHelper.shared.deleteSession()
            presenter?.navigateToLogin()
        } catch  {
            presenter?.logoutFailed(with: "Error", error: "Logout error")
        }
        
    }

}
