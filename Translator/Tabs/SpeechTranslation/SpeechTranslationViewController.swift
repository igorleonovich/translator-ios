//
//  SpeechTranslationViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 2/27/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class SpeechTranslationViewController: BaseTranslationViewController, MDVTabbableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func mdvTabBarItem() -> UITabBarItem {
        let item = UITabBarItem()
        item.selectedImage = UIImage.checkmark
        item.image = UIImage.checkmark
        return item
    }
}
