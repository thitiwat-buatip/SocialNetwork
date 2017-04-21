//
//  ViewController.swift
//  SocialNetwork
//
//  Created by Thitiwat on 4/21/2560 BE.
//  Copyright © 2560 Thitiwat. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SingInVC: UIViewController {
    @IBOutlet weak var emailField: FancyFieid!
    @IBOutlet weak var passwordField: FancyFieid!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Error : \(String(describing: error))")
            }
            else if result?.isCancelled == true {
                print("User canceled")
            }
            
            else {
                print("Successfully")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.FirebaseAuth(credential)
            }
        }
    }
    
    func FirebaseAuth(_ credential : FIRAuthCredential){
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Error : \(String(describing: error))")
            }
            else {
                print("Successfully with Firebase")
            }
        })
    }
    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let password = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Succesfully to login Firebase")
                }
                else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("Error \(error!)")
                        }
                        else{
                            print("Successfully to login Firebase")
                        }
                    })
                }
            })
        }
        
    }
    
}
