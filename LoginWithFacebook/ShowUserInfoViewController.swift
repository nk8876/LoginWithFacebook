//
//  ShowUserInfoViewController.swift
//  LoginWithFacebook
//
//  Created by Dheeraj Arora on 03/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class ShowUserInfoViewController: UIViewController {
    
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblFirstName.text = UserData.sharedInstance.firstName
        self.lblLastName.text = UserData.sharedInstance.lastName
        self.lblFullName.text = UserData.sharedInstance.fullName
        self.lblEmail.text = UserData.sharedInstance.email
        let url = UserData.sharedInstance.url
    
        do {
            let data = try                                 Data.init(contentsOf: URL.init(string:url!)!)
            DispatchQueue.main.async {
                let image: UIImage = UIImage(data: data)!
                self.userPic.image = image
            }
        } catch let error {
            print("Can not fetch image \(error)")
        }
       
    }
    
}
