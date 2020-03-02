//
//  UIView+Extensions.swift
//  Translator
//
//  Created by Igor Leonovich on 3/2/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

extension UIView {
    
    func round() {
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
}
