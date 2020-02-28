//
//  TextTranslationViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 2/27/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class TextTranslationViewController: BaseTranslationViewController, MDVTabbableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        translate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let label = UILabel(frame: view.frame)
        label.text = "Text Translation"
        label.textAlignment = .center
        view.addSubview(label)
        label.center = view.center
    }
    
    func mdvTabBarItem() -> UITabBarItem {
        let item = UITabBarItem()
        item.selectedImage = UIImage.checkmark
        item.image = UIImage.checkmark
        return item
    }
    
    func translate() {
        /// Translates a text.
        SwiftGoogleTranslate.shared.translate("Hello!", "ru", "en") { (text, error) in
            if let t = text {
                print(t)
            }
        }
        
        /// Detects a language.
//        SwiftGoogleTranslate.shared.detect("¡Hola!") { (detections, error) in
//            if let detections = detections {
//                for detection in detections {
//                    print(detection.language)
//                    print(detection.isReliable)
//                    print(detection.confidence)
//                    print("---")
//                }
//            }
//        }
        
        /// Prints available languages.
//        SwiftGoogleTranslate.shared.languages { (languages, error) in
//            if let languages = languages {
//                for language in languages {
//                    print(language.language)
//                    print(language.name)
//                    print("---")
//                }
//            }
//        }
    }
}
