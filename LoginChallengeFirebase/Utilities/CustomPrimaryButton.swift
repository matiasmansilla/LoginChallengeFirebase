//
//  CustomPrimaryButton.swift
//  LoginChallengeFirebase
//
//  Created by Dardo Mansilla on 05/12/2021.
//

import UIKit

@IBDesignable
open class CustomPrimaryButton: UIButton {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    let image = UIImage(named: "img_main button")
    
    self.setBackgroundImage(image, for: .normal)
    self.layer.cornerRadius = 22
    self.layer.masksToBounds = true
  }
  
}

