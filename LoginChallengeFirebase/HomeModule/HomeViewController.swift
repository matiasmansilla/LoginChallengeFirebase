//
//  HomeViewController.swift
//  LoginChallengeFirebase
//
//  Created Dardo Mansilla on 04/12/2021.
//

import UIKit
import FirebaseDatabase

class HomeViewController: UIViewController {
    //MARK: - Constants
    let constants = LoginChallengeFirebaseConstant()
    //MARK: - Outlets
    @IBOutlet weak var userLoggedLabel: UILabel?
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Properties
    var presenter: HomePresenterProtocol?
    private var ref: DatabaseReference?
    
    //MARK: - Initializer
    static func instantiate() -> HomeViewController {
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: .main)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            return viewController
        } else {
            return HomeViewController()
        }
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.getEmail()
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        presenter?.logout()
    }
    
    private func setupUI() {
        view.backgroundColor = constants.bgMainScreenColor
    }
    
}
//MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func refresh(name value: String) {
        nameLabel?.text = value
    }
}
