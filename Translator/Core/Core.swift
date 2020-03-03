//
//  Core.swift
//  Translator
//
//  Created by Igor Leonovich on 3/3/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import Foundation

class Core {
    
    func getLanguages() {
        DispatchQueue.global().async {
            // Prints available languages.
            SwiftGoogleTranslate.shared.languages { (data, error) in
                if let data = data {
                    Language.save(from: data)
                } else if let error = error {
                    print(error)
                }
            }
        }
    }
}
