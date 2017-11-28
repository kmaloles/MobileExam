//
//  AuthResponse.swift
//  MobileExam
//
//  Created by Kevin Maloles on 11/28/17.
//  Copyright © 2017 Kevin Maloles. All rights reserved.
//

import Foundation
import Gloss

struct GenericResponse: JSONDecodable {
    let error: Bool?
    let message: String?
    let user:User?
    let player:User?
    
    init?(json: JSON) {
        self.error = "error" <~~ json
        self.user = "user" <~~ json
        self.message = "message" <~~ json
        self.player = "player" <~~ json
    }
}

struct User: JSONDecodable {
    let firstName: String?
    let lastName: String?
    let email: String?
    let address: String?
    let city: String?
    let state: String?
    let zip: String?
    let userName: String?
    let mobile: String?
    let tokenId: String?
    let tokenKey: String?
    
    init?(json: JSON) {
        self.firstName = "fldUserFirstName" <~~ json
        self.lastName = "fldUserLastName" <~~ json
        self.email = "fldUserEmail" <~~ json
        self.address = "fldUserAddress" <~~ json
        self.city = "fldUserCity" <~~ json
        self.state = "fldUserState" <~~ json
        self.zip = "fldUserZip" <~~ json
        self.userName = "fldUserUsername" <~~ json
        self.mobile = "fldUserMobile" <~~ json
        self.tokenId = "token_id" <~~ json
        self.tokenKey = "token_key" <~~ json
    }
}

