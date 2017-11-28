//
//  DBManager.swift
//  MobileExam
//
//  Created by Kevin Maloles on 11/28/17.
//  Copyright © 2017 Kevin Maloles. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class DBManager{
    
    static let sharedInstance = DBManager()
    let realm = try! Realm()
    
    func getActiveUser() -> RealmUser? {
        return realm.objects(RealmUser.self).first
    }
    
    func createUser(user: User, password: String) {
        let realmUser = RealmUser()
        realmUser.firstName = user.firstName!
        realmUser.lastName = user.lastName!
        realmUser.email = user.email!
        realmUser.address = user.address!
        realmUser.mobile = user.mobile!
        realmUser.city = user.city!
        realmUser.state = user.state!
        realmUser.zip = user.zip!
        realmUser.username = user.userName!
        realmUser.tokenId = user.tokenId!
        realmUser.tokenKey = user.tokenKey!
        realmUser.password = password
        try! realm.write {
            realm.add(realmUser)
        }
    }
    
    func delete(){
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func update(user: RealmUser
        , firstName:String
        , lastName:String
        , email:String
        , address:String
        , mobile:String
        , city:String
        , state:String
        , zip:String
        , username:String
        , password:String)
    {
        try! realm.write {
            user.firstName = firstName
            user.lastName = lastName
            user.email = email
            user.address = address
            user.mobile = mobile
            user.city = city
            user.state = state
            user.zip = zip
            user.username = username
            user.password = password
        }
    }
}
