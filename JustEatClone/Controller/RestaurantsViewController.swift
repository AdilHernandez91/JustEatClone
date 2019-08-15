//
//  ViewController.swift
//  JustEatClone
//
//  Created by German on 14/08/2019.
//  Copyright © 2019 German. All rights reserved.
//

import UIKit
import Firebase

class RestaurantsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if !Auth.auth().isAuthenticated() {
    
            presentOnboarding()
            
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func onLogoutPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            presentOnboarding()
        }
        catch {
            debugPrint(error)
            Auth.auth().handleAuthError(error: error, vc: self)
        }
        
    }
    
    private func presentOnboarding() {
        let storyboard = UIStoryboard(name: Storyboard.Onboarding, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.Onboarding)
        
        present(controller, animated: true, completion: nil)
    }
    
}

