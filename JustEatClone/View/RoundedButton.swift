//
//  RoundedButton.swift
//  JustEatClone
//
//  Created by German on 14/08/2019.
//  Copyright © 2019 German. All rights reserved.
//

import UIKit

@IBDesignable public class RoundedButton: UIButton {
    
    public override func awakeFromNib() {
        titleLabel?.font = UIFont(name: Fonts.Futura, size: 17)
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 8 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var height: CGFloat = 50 {
        didSet {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    @IBInspectable public var bgColor: UIColor = AppColours.Blue {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
}
