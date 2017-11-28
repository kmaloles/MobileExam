//
//  SignInViewController.swift
//  MobileExam
//
//  Created by Kevin Maloles on 11/28/17.
//  Copyright © 2017 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit

class SignInViewController:UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    let apiService = APIService.sharedInstance
    let authManager = AuthManager.sharedInstance
    let dbManager = DBManager.sharedInstance
    
    static func storyboardInstance() -> SignInViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: SignInViewController.self)) as! SignInViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSignUpTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: String(describing: SignUpViewController.self), sender: self)
    }
    
    @IBAction func onSignInTapped(_ sender: UIButton) {
        if let username = usernameField.text, let password = passwordField.text {
            self.showLoading()
            apiService.signIn(username: username, password: password){ success, errorText, loginResponse in
                self.hideLoading()
                if success {
                    if let response = loginResponse,
                        let userProfile = response.user {
                        
                        self.authManager.persistToken(user: userProfile)
                        self.dbManager.createUser(user: userProfile, password: password)
                        self.present(ProfileViewController.storyboardInstance(), animated: true, completion: nil)
                    }else if let errorMessage = errorText{
                        //check for errors
                        self.displayAlert(message: errorMessage)
                    }else{
                        self.displayAlert(message: Constants.genericError)
                    }
                }else{
                    self.displayAlert(message: errorText!)
                }
            }
        }
    }
    
}
