//
//  HomeInteractor.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit
import FirebaseDatabase

/// Home Module Interactor
class HomeInteractor: HomeInteractorProtocol {

    //MARK: - Properties
    weak var presenter: HomePresenterProtocol?
    private var ref: DatabaseReference? = Database.database().reference()
    
    //MARK: - Methods
    func logoutAndCleanSession() {
        SessionHelper.shared.deleteSession()
        presenter?.navigateToLogin()
    }
    
    func observeData() {
//        ref?.child(SessionHelper.shared.getUser() ?? "").observe(.childChanged, with: { snapshot in
//            print(snapshot.value ?? "")
//            self.presenter?.updateView(with: snapshot.value as? String ?? "")
//        })
    }

}
