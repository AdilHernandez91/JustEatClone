//
//  RegisterViewController.swift
//  JustEatClone
//
//  Created by German on 15/08/2019.
//  Copyright © 2019 German. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK - Actions
    
    @IBAction func onClosePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSignUpPressed(_ sender: Any) {
        guard let username = usernameTextField.text , username.isNotEmpty ,
            let password = passwordTextField.text , password.isNotEmpty ,
            let email = emailTextField.text , email.isNotEmpty else {
                
                showDialog(title: "Validation error", message: "All fields are required")
                
                return
        }
        
        createUser(email: email, password: password, username: username)
    }
}

extension RegisterViewController {
    
    private func createUser(email: String, password: String, username: String) {
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                debugPrint(error)
                
                Auth.auth().handleAuthError(error: error, vc: self)
                self.activityIndicator.stopAnimating()
            }
            else {
                guard let firstUser = result?.user else { return }
                
                let user = User.init(id: firstUser.uid, email: email, username: username)
                self.createFirestoreUser(user: user)
            }
        }
    }
    
    private func createFirestoreUser(user: User) {
        let newUserRef = Firestore.firestore().collection(Collections.Users).document(user.id)
        
        let data = User.modelToData(user: user)
        
        newUserRef.setData(data) { (error) in
            if let error = error {
                self.usernameTextField.reset()
                self.emailTextField.reset()
                self.passwordTextField.reset()
                
                debugPrint(error)
                Auth.auth().handleAuthError(error: error, vc: self)
            }
            else {
                self.showDialog(title: "Success", message: "Your account has been created. Please log in now.")
                
                self.dismiss(animated: true, completion: {
                    self.presentMain()
                })
            }
            
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func presentMain() {
        let storyboard = UIStoryboard(name: Storyboard.Main, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.Restaurants)
        
        present(controller, animated: true, completion: nil)
    }
    
}
