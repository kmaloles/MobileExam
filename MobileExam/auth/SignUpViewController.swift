//
//  SignUpViewController.swift
//  MobileExam
//
//  Created by Kevin Maloles on 11/28/17.
//  Copyright © 2017 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController:UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var mobile: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var state: UITextField!
    
    
    @IBOutlet weak var zip: UITextField!
    
    let apiService = APIService.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onSignUpTapped(_ sender: UIButton) {
        if let firstName = firstName.text
            , let lastName = lastName.text
            , let email = email.text
            , let mobile = mobile.text
            , let address = address.text
            , let city = city.text
            , let username = username.text
            , let password = password.text
            , let state = state.text
            , let zip = zip.text
        {
            self.showLoading()
            
            let user = RealmUser()
            user.firstName = firstName
            user.lastName = lastName
            user.email = email
            user.mobile = mobile
            user.address = address
            user.city = city
            user.username = username
            user.password = password
            user.state = state
            user.zip = zip
            
            apiService.register(user: user){ success, message in
                self.hideLoading()
                if success {
                    self.displayAlert(message: message!)
                }else{
                    self.displayAlert(message: Constants.genericError)
                }
            }
        }
    }
    
    @IBAction func onBackToSignInTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
