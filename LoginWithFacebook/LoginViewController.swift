//
//  LoginViewController.swift
//  LoginWithFacebook
//
//  Created by Dheeraj Arora on 04/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.delegate = self
        loginButton.loginBehavior = .web
        loginButton.readPermissions = ["public_profile","email"]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if (FBSDKAccessToken.current() != nil)
        {
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController!.pushViewController(homeVC, animated: false)
        }
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if (error != nil){
            print(error.localizedDescription)
            return
        }
        if result.token != nil
        {
            //Get User Access Token
            let token : FBSDKAccessToken = result.token
            print("Token = \(token.tokenString ?? "")")
            print("User ID = \(token.userID ?? "")")
             let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController!.pushViewController(homeVC, animated: false)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logout")
    }
    
}
