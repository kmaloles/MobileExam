//
//  APIService.swift
//  MobileExam
//
//  Created by Kevin Maloles on 11/28/17.
//  Copyright © 2017 Kevin Maloles. All rights reserved.
//

import Foundation
import Gloss
import Alamofire

class APIService {
    
    static let sharedInstance = APIService()
    
    func signIn(username: String, password: String, callback: @escaping (_ success:Bool, _ errorText:String?, _ loginResponse:GenericResponse?) -> Void) {
        
        let urlString = Constants.baseUrl + "/user-login"
        let parameters = ["username":username, "password":password]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                do{
                    let json = try JSONSerialization.jsonObject(with: response.data!, options:JSONSerialization.ReadingOptions.allowFragments) as! JSON
                    let loginResponse = GenericResponse(json:json)
                    //see error message
                    if let errorMessage = loginResponse?.message {
                        callback(true,errorMessage, nil)
                    }else{
                        callback(true,nil, loginResponse)
                    }
                    
                }catch{
                    callback(false,Constants.genericError, nil)
                }
            }
    }
    
    func update(user: RealmUser, callback: @escaping (_ success:Bool, _ errorText:String?) -> Void) {
        let urlString = Constants.baseUrl + "/user-update"
        let parameters = ["firstname":user.firstName
            , "lastname":user.lastName
            , "email":user.email
            , "mobile":user.mobile
            , "address":user.address
            , "city":user.city
            , "state":user.state
            , "zip":user.zip
            , "username":user.username
            , "password":user.password
            , "token_id":user.tokenId
            , "token_key":user.tokenKey]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                do{
                    let json = try JSONSerialization.jsonObject(with: response.data!, options:JSONSerialization.ReadingOptions.allowFragments) as! JSON
                    if let response = GenericResponse(json:json){
                        callback(true,response.message!)
                    }else{
                        callback(false,Constants.genericError)
                    }
                }catch{
                    callback(false,Constants.genericError)
                }
        }
    }
    
    func register(user: RealmUser, callback: @escaping (_ success:Bool, _ errorText:String?) -> Void) {
        let urlString = Constants.baseUrl + "/user-registration"
        let parameters = ["firstname":user.firstName
            , "lastname":user.lastName
            , "email":user.email
            , "mobile":user.mobile
            , "address":user.address
            , "city":user.city
            , "state":user.state
            , "zip":user.zip
            , "username":user.username
            , "password":user.password]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                do{
                    let json = try JSONSerialization.jsonObject(with: response.data!, options:JSONSerialization.ReadingOptions.allowFragments) as! JSON
                    if let response = GenericResponse(json:json){
                        callback(true,response.message!)
                    }else{
                        callback(false,Constants.genericError)
                    }
                }catch{
                    callback(false,Constants.genericError)
                }
        }
    }
    
}
