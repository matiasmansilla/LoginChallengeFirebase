//
//  RegisterInteractor.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 05/12/2021.
//

import UIKit
import FirebaseDatabase

/// Register Module Interactor
class RegisterInteractor: RegisterInteractorProtocol {
    
    //MARK: - Properties
    weak var presenter: RegisterPresenterProtocol?
    
    func saveInDB(user: User) {
        let ref = Database.database().reference().child("UserInfo").child( SessionHelper.shared.getUser() ?? "unknown_mail")
        ref.setValue(user.dictionary) { [weak self] (error, reference) in
            if let error = error {
                self?.presenter?.setError(title: "Error DB", message: error.localizedDescription)
            } else {
                self?.presenter?.goToHome()
            }
        }
    }

}
