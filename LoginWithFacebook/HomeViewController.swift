//
//  HomeViewController.swift
//  LoginWithFacebook
//
//  Created by Dheeraj Arora on 04/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if (FBSDKAccessToken.current() != nil)
        {
            fetchUserData()
            
        }
    }
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        self.navigationController?.popViewController(animated: false)

    }
    @IBAction func showUserDataAction(_ sender: UIButton) {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowUserInfoViewController") as! ShowUserInfoViewController
        self.navigationController!.pushViewController(homeVC, animated: false)
    }
    
    func fetchUserData()
    {
        print("Fetch User Data")
        let parameters = ["fields":"id,email,name,first_name,last_name,picture.type(large)"]
        FBSDKGraphRequest(graphPath: "Me", parameters: parameters)?.start(completionHandler: { (connection, result, error)-> Void in
            if error != nil{
                print(error as Any)
                return
            }
            let dict = result as! [String : Any]
            print(dict)
            if let id = dict["id"] as? Int{
                UserData.sharedInstance.id = id
            }
            if let email = dict["email"] as? String{
                UserData.sharedInstance.email = email
            }
            if let firstName = dict["first_name"] as? String{
                UserData.sharedInstance.firstName = firstName
            }
            if let lastName = dict["last_name"] as? String{
                UserData.sharedInstance.lastName = lastName
            }
            if let fullName = dict["name"] as? String{
                UserData.sharedInstance.fullName = fullName
            }
            if let picture = dict["picture"] as? [String : Any] {
                let data = picture["data"] as? [String : Any]
                if let url = data!["url"] as? String{
                    UserData.sharedInstance.url = url
                }
            }
        })
    }
    @IBAction func btnFetchFriendsListAction(_ sender: UIButton) {
        let params = ["fields":"name,picture.type(normal)"]
        FBSDKGraphRequest(graphPath: "me/friends", parameters: params)? .start(completionHandler: { (connection, result, requestError)-> Void in
            if let error = requestError {
                print(error.localizedDescription)
            } else {
                
                let dict = result as! [String : [Any]]
                let data = dict["data"]
                print(data?.count ?? 0)
            }
        })
    }
}
