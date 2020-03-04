//
//  Core.swift
//  Translator
//
//  Created by Igor Leonovich on 3/3/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import Foundation

class Core {
    
    init() {
        if let languages = Language.getFromJSON() {
            Settings.languages = languages
        }
    }
}
