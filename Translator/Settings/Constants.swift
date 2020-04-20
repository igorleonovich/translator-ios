//
//  Constants.swift
//  Translator
//
//  Created by Igor Leonovich on 3/3/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static let didChangedColorMode = Notification.Name("didChangedColorMode")
    static let didChangedOfflineMode = Notification.Name("didChangedOfflineMode")
}

struct Constants {
    
    static let languagesFile = getDocumentsDirectory().appendingPathComponent("languages.json")
    
    static let GoogleAPIKey = "AIzaSyB3n5JRdcYrek-TYbKdBhhwIaGkSjSc55s"
}
