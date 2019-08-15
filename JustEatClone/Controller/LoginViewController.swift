//
//  LoginViewController.swift
//  JustEatClone
//
//  Created by German on 14/08/2019.
//  Copyright © 2019 German. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    
    @IBAction func onClosePressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func onLoginPressed(_ sender: Any) {
        
        guard let email = emailTextField.text, !email.isEmpty ,
            let password = passwordTextField.text , !password.isEmpty else {
                
                showDialog(title: "Validation error", message: "Email address and password are required")
                
                return
        }
        
        activityIndicator.startAnimating()
        authenticate(email: email, password: password)
        
    }
    
}

extension LoginViewController {
    
    private func authenticate(email: String, password: String) {
        
        activityIndicator.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.emailTextField.reset()
                self.passwordTextField.reset()
                
                debugPrint(error)
                Auth.auth().handleAuthError(error: error, vc: self)
                
                self.activityIndicator.stopAnimating()
            }
            else {
                self.activityIndicator.stopAnimating()
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
}
