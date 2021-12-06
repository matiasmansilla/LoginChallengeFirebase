//
//  MainWireframe.swift
//  LoginChallengeFirebase
//
//  Created by Dardo Mansilla on 04/12/2021.
//

import Foundation

class MainWireframe {
    
    static func goToFirstScreen() {
        if SessionHelper.shared.isSessionStored() {
            HomeRouter().goToHome()
        } else {
            LoginRouter().goToLogin()
        }
    }
}
