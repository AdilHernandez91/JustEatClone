//
//  Firebase.swift
//  JustEatClone
//
//  Created by German on 15/08/2019.
//  Copyright © 2019 German. All rights reserved.
//

import Firebase

extension Auth {
    
    public func handleAuthError(error: Error, vc: UIViewController) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    public func isAuthenticated() -> Bool {
        if Auth.auth().currentUser == nil {
            return false
        }
        
        return true
    }
    
}
