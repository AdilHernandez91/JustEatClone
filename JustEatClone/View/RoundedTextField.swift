//
//  RoundedTextField.swift
//  JustEatClone
//
//  Created by German on 14/08/2019.
//  Copyright © 2019 German. All rights reserved.
//

import UIKit


@IBDesignable public class RoundedTextField: UITextField {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 60
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 10 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
