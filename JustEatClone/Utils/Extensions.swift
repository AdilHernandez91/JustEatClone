//
//  Extensions.swift
//  JustEatClone
//
//  Created by German on 15/08/2019.
//  Copyright © 2019 German. All rights reserved.
//

import UIKit
import Firebase

extension String {
    
    var isNotEmpty: Bool {
        
        return !isEmpty
        
    }
    
}

extension UIViewController {
    
    public func showDialog(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

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
        else {
            return true
        }
        
    }
    
}

extension UITextField {
    
    public func reset() {
        self.text = ""
    }
    
}
