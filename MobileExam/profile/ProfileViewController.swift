//
//  ProfileViewController.swift
//  MobileExam
//
//  Created by Kevin Maloles on 11/28/17.
//  Copyright © 2017 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController:UIViewController{
    
    var dbManager = DBManager.sharedInstance
    var authManager = AuthManager.sharedInstance
    var apiService = APIService.sharedInstance
    
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
    
    static func storyboardInstance() -> ProfileViewController {
        let storyboard = UIStoryboard(name: String(describing: ProfileViewController.self), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: ProfileViewController.self)) as! ProfileViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //init views
        if let user = dbManager.getActiveUser(){
            firstName.text = user.firstName
            lastName.text = user.lastName
            email.text = user.email
            mobile.text = user.mobile
            address.text = user.address
            city.text = user.city
            username.text = user.username
            password.text = user.password
            state.text = user.state
            zip.text = user.zip
            
        }
    }
    
    @IBAction func onSignOutTapped(_ sender: UIButton) {
        dbManager.delete()
        authManager.persistToken(user: nil)
        self.present(SignInViewController.storyboardInstance(), animated: true, completion: nil)
    }
    
    @IBAction func onUpdateTapped(_ sender: UIButton) {
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
            , let user = dbManager.getActiveUser(){
            self.showLoading()
            
            //update the localdata model
            dbManager.update(user: user, firstName: firstName, lastName: lastName, email: email, address: address, mobile: mobile, city: city, state: state, zip: zip, username: username, password: password)
            
            apiService.update(user: user){ success, message in
                self.hideLoading()
                if success {
                    self.displayAlert(message: message!)
                }else{
                    self.displayAlert(message: Constants.genericError)
                }
            }
        }
    }
    
    
}
