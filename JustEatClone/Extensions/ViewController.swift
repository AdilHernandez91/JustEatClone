//
//  ViewController.swift
//  JustEatClone
//
//  Created by German on 15/08/2019.
//  Copyright © 2019 German. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func showDialog(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}
