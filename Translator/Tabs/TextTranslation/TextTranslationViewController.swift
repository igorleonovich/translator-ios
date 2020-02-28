//
//  TextTranslationViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 2/27/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class TextTranslationViewController: BaseTranslationViewController, MDVTabbableViewController {
    
    var textField: UITextField!
    var button: UIButton!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textField = UITextField()
        textField.placeholder = "English text"
        textField.textAlignment = .center
        
        button = UIButton(type: .system)
        button.setTitle("Translate", for: .normal)
        button.addTarget(self, action: #selector(translate), for: .touchUpInside)
        
        label = UILabel()
        label.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [textField, button, label])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    func mdvTabBarItem() -> UITabBarItem {
        let item = UITabBarItem()
        item.selectedImage = UIImage.checkmark
        item.image = UIImage.checkmark
        return item
    }
    
    @objc func translate() {
        /// Translates a text.
        SwiftGoogleTranslate.shared.translate(textField.text!, "ru", "en") { (text, error) in
            if let t = text {
                print(t)
                DispatchQueue.main.async {
                    self.label.text = t
                    self.textField.resignFirstResponder()
                }
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
