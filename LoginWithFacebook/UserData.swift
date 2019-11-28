//
//  UserData.swift
//  LoginWithFacebook
//
//  Created by Dheeraj Arora on 03/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import Foundation
import UIKit
class UserData{
    
    static let sharedInstance : UserData = UserData()
     var firstName : String?
     var lastName : String?
     var fullName : String?
     var email : String?
     var id : Int?
     var url : String?
     var fname : String?
     var fPicture : String?
    
    func friendsList(fname : String,fPicture : String){
       self.fname = fname
        self.fPicture = fPicture
    }
    
}
