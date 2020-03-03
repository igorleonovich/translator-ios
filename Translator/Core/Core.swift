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
            SwiftGoogleTranslate.shared.languages { (languages, error) in
                if let languages = languages {
                    
                    for language in languages {
                        print(language.language)
                        print(language.name)
                        print("---")
                    }
                }
            }
        }
    }
}
