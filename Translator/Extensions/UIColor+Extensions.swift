//
//  UIColor+Extensions.swift
//  Translator
//
//  Created by Igor Leonovich on 3/2/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct Blue {
        static let DeepSkyBlue = UIColor(red: 3, green: 180, blue: 255)
        static let LilyWhite = UIColor(red: 230, green: 246, blue: 254)
        static let LilyWhiteSemiTransparent = UIColor(red: 230, green: 246, blue: 254, alpha: 0.5)
        static let Mirage = UIColor(red: 25, green: 27, blue: 39)
    }
    
    struct Green {
        static let Lima = UIColor(red: 127, green: 184, blue: 32)
    }
    
    struct Black {
        static let Black025Alpha = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        static let Gunmetal = UIColor(red: 47, green: 51, blue: 60)
        static let MidGray = UIColor(red: 88, green: 98, blue: 107)
    }
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

