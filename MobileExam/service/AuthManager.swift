//
//  AuthManager.swift
//  MobileExam
//
//  Created by Kevin Maloles on 11/28/17.
//  Copyright © 2017 Kevin Maloles. All rights reserved.
//

import Foundation

class AuthManager{
    
    static let sharedInstance = AuthManager()
    let userDefaults = UserDefaults.standard
    
    static let KEY_TOKEN = "user_token"
    static let KEY_ID = "user_token_id"
//    static let KEY_FIRST_NAME = "user_first_name"
//    static let KEY_LAST_NAME = "user_last_name"
//    static let KEY_EMAIL = "user_email"
//    static let KEY_ADDRESS = "user_address"
//    static let KEY_CITY = "user_city"
//    static let KEY_STATE = "user_state"
//    static let KEY_ZIP = "user_zip"
//    static let KEY_USERNAME = "user_username"
//    static let KEY_MOBILE = "user_mobile"
    
    func persistToken(user: User?){
        //null checks
//        if let firstName = user.firstName,
//            let lastName = user.lastName,
//            let email = user.email,
//            let address = user.address,
//            let city = user.city,
//            let state = user.state,
//            let zip = user.zip,
//            let userName = user.userName,
//            let mobile = user.mobile,
        if let tokenKey = user?.tokenKey,
                let tokenId = user?.tokenId {
            
            userDefaults.set(tokenKey, forKey: AuthManager.KEY_TOKEN)
            userDefaults.set(tokenId, forKey: AuthManager.KEY_ID)
//            userDefaults.set(firstName, forKey: AuthManager.KEY_FIRST_NAME)
//            userDefaults.set(lastName, forKey: AuthManager.KEY_LAST_NAME)
//            userDefaults.set(email, forKey: AuthManager.KEY_EMAIL)
//            userDefaults.set(address, forKey: AuthManager.KEY_ADDRESS)
//            userDefaults.set(city, forKey: AuthManager.KEY_CITY)
//            userDefaults.set(state, forKey: AuthManager.KEY_STATE)
//            userDefaults.set(zip, forKey: AuthManager.KEY_ZIP)
//            userDefaults.set(userName, forKey: AuthManager.KEY_USERNAME)
//            userDefaults.set(mobile, forKey: AuthManager.KEY_MOBILE)
        }else{
            //signing out
            userDefaults.set("", forKey: AuthManager.KEY_TOKEN)
        }
        userDefaults.synchronize()
    }
    
    func needToSignIn() -> Bool {
        return AuthManager.sharedInstance.getUserToken() == ""
    }
    
    func getUserToken() -> String? {
        if let token = userDefaults.object(forKey: AuthManager.KEY_TOKEN) as? String {
            return token
        }else{
            return ""
        }
    }
}
