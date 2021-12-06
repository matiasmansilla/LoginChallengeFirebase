//
//  UIViewController+LoadinfOverlay.swift
//  LoginChallengeFirebase
//
//  Created by Dardo Mansilla on 05/12/2021.
//

import UIKit
extension UIViewController {

  func showLoadingOverlay() {
    LoadingOverlay.shared.show(over: self.view)
  }
  
  func hideLoadingOverlay(){
      LoadingOverlay.shared.hide()
  }
}
