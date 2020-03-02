//
//  CustomButton.swift
//  Translator
//
//  Created by Igor Leonovich on 3/2/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        round()
        tintColor = UIColor.Blue.DeepSkyBlue
    }
    
    override var isHighlighted: Bool {
        get {
            return false
        }
        set {
            backgroundColor = newValue ? UIColor.Blue.DeepSkyBlue : .white
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.tintColor = newValue ? .white : UIColor.Blue.DeepSkyBlue
            }
        }
    }
}
