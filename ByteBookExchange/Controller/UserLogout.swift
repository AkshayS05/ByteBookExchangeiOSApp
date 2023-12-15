//
//  UserLogout.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-14.
//

// UserLogout.swift

import FirebaseAuth
import UIKit

protocol UserLogout {
    func logOut()
}

extension UserLogout where Self: UIViewController {

    
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

