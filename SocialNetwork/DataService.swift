//
//  DataService.swift
//  SocialNetwork
//
//  Created by Thitiwat on 4/22/2560 BE.
//  Copyright © 2560 Thitiwat. All rights reserved.
//

import Foundation
import UIKit
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("user")
    
    var REF_BASE : FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS : FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS : FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUSER(uid : String, userData : Dictionary< String, String > ) {
        
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
    
    
    
}
