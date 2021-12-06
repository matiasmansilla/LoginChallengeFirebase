//
//  RegisterViewController.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 05/12/2021.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewProtocol {
    // MARK: - Outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameTextField: ValidableTextField!
    @IBOutlet weak var lastNameTextField: ValidableTextField!
    @IBOutlet weak var ageTextField: ValidableTextField!
    @IBOutlet weak var dateTextField: ValidableTextField!
    @IBOutlet weak var loginButton: CustomPrimaryButton!
    @IBOutlet weak var agreeTermsLabel: UILabel!
    
    //MARK: - Constant
    let constant = LoginChallengeFirebaseConstant()
    
    //MARK: - Properties
    var presenter: RegisterPresenterProtocol?
    let user: User = User()
    var datePicker: UIDatePicker?
    var isValidForm: Bool = false {
        didSet {
            loginButton.isEnabled = self.isValidForm ? true : false
        }
    }
    
    //MARK: - Initializer
    static func instantiate() -> RegisterViewController {
        let storyboard = UIStoryboard(name: "RegisterViewController", bundle: .main)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            return viewController
        } else {
            return RegisterViewController()
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        ageTextField.delegate = self
        dateTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }

    
    private func setupUI() {
        loginButton.isEnabled = false
        datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: dateTextField.frame.size.width, height: 200))
        datePicker?.datePickerMode = .date
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
        dateTextField.inputView = datePicker
        let doneButton = UIBarButtonItem.init(title: "Ok", style: .done, target: self, action: #selector(self.datePickerDone))
        let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil), doneButton], animated: true)
        dateTextField.inputAccessoryView = toolBar
        
        view.backgroundColor = constant.bgMainScreenColor
        
        nameTextField.placeholder = "Ingrese su nombre"
        lastNameTextField.placeholder = "Ingrese su apellido"
        ageTextField.placeholder = "Ingrese su edad"
        dateTextField.placeholder = "Ingrese su fecha de nacimiento"
    }
    
    private func validateForm() -> Bool {
        guard let nameText = nameTextField.text, !nameText.isEmpty else { return false }
        guard let lastNameText = lastNameTextField.text, !lastNameText.isEmpty else { return false }
        guard let emailText = ageTextField.text, !emailText.isEmpty else { return false }
        guard let dateText = dateTextField.text, !dateText.isEmpty else { return false }
        return true
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        
        var user: User = User()
        user.name = nameTextField.text
        user.lastname = lastNameTextField.text
//        user.email = ageTextField.text
        
//        let now: Date = Date()
//        if let birthday: Date = datePicker?.date {
//            let calendar: Calendar = Calendar.current
//            let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
//            user.age = ageComponents.year
//        }
        showLoadingOverlay()
        presenter?.save(user: user)
    }
    
    @objc func datePickerDone() {
        dateTextField.resignFirstResponder()
    }
    
    @objc func dateChanged() {
        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = "MM/dd/yyyy"
        if let date = datePicker?.date {
            dateTextField.text = dateFormatted.string(from: date)
            let now: Date = Date()
            if let birthday: Date = datePicker?.date {
                let calendar: Calendar = Calendar.current
                let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
                ageTextField.text = "\(ageComponents.year ?? 0)"
            }
        }
    }
    
    @objc private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIView.endEditing), to: nil, from: nil, for: nil)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        isValidForm = validateForm()
    }
}
