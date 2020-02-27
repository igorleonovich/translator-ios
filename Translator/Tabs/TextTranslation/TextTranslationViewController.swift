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
}
