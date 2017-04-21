//
//  FeedVC.swift
//  SocialNetwork
//
//  Created by Thitiwat on 4/21/2560 BE.
//  Copyright © 2560 Thitiwat. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func singOut(_ sender: Any) {
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ID removed from keychain")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
        
    }
    

   

}
