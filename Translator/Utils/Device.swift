//
//  Device.swift
//  Translator
//
//  Created by Igor Leonovich on 3/4/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

struct Device {
    
    static var bottomSafeAreaInsets: CGFloat {
        return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
    }
}
