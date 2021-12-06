//
//  ValidableTextField.swift
//  LoginChallengeFirebase
//
//  Created by Dardo Mansilla on 05/12/2021.
//

import UIKit

@IBDesignable
open class ValidableTextField: UITextField {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  public override func textRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16))
  }

  public override func editingRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16))
  }

  public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16))
  }
  
  func setup() {
    self.borderStyle = .none
    self.layer.masksToBounds = false
    self.backgroundColor = LoginChallengeFirebaseConstant().bgMainScreenColor
    self.layer.shadowColor = LoginChallengeFirebaseConstant().lightBlue?.cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 1)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 0.0
  }
}
