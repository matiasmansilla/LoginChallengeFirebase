//
//  SessionHelper.swift
//  LoginChallengeFirebase
//
//  Created by Dardo Mansilla on 04/12/2021.
//

import Foundation

class SessionHelper {
    
    public static let shared = SessionHelper()
    
    let defaults = UserDefaults.standard
    let userEmailSession = "SessionHelper.Session.User.email"
    let sessionDefaultsKey = "SessionHelper.Session"
    
    
    private init() { }
    
    func saveUser(email: String?) {
        guard let email = email?.replacingOccurrences(of: ".", with: "") else { return }
        defaults.setValue(email, forKey: userEmailSession)
        defaults.synchronize()
    }
    
    func getUser() -> String? {
        guard let user = defaults.string(forKey: userEmailSession) else { return nil }
        return user
    }
    
    func saveSession() {
        defaults.set(true, forKey: sessionDefaultsKey)
        defaults.synchronize()
    }
    
    func deleteSession() {
        defaults.set(false, forKey: sessionDefaultsKey)
        defaults.synchronize()
    }
    
    
    func isSessionStored() -> Bool {
        return defaults.bool(forKey: sessionDefaultsKey)
    }
    
    func clearAll() {
        defaults.removeObject(forKey: sessionDefaultsKey)
        defaults.synchronize()
    }
    
}
