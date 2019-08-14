//
//  ViewController.swift
//  JustEatClone
//
//  Created by German on 14/08/2019.
//  Copyright © 2019 German. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presentOnboarding()
    }
    
    private func presentOnboarding() {
        let storyboard = UIStoryboard(name: Storyboard.Onboarding, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.Onboarding)
        
        present(controller, animated: true, completion: nil)
    }
    
}

