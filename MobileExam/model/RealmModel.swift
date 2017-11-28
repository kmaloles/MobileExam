//
//  RealmModel.swift
//  MobileExam
//
//  Created by Kevin Maloles on 11/28/17.
//  Copyright © 2017 Kevin Maloles. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUser: Object{
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var email = ""
    @objc dynamic var address = ""
    @objc dynamic var city = ""
    @objc dynamic var state = ""
    @objc dynamic var zip = ""
    @objc dynamic var username = ""
    @objc dynamic var password = ""
    @objc dynamic var mobile = ""
    @objc dynamic var tokenId = ""
    @objc dynamic var tokenKey = ""
    
}
