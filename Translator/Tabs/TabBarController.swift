//
//  TabBarController.swift
//  Translator
//
//  Created by Igor Leonovich on 2/27/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let speechTranslationVC = SpeechTranslationViewController()
        speechTranslationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        speechTranslationVC.tabBarItem.title = ""

        let textTranslationVC = TextTranslationViewController()
        textTranslationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let imageTranslationVC = ImageTranslationViewController()
        imageTranslationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        let keyboardTranslationVC = KeyboardTranslationViewController()
        keyboardTranslationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)

        viewControllers = [speechTranslationVC, textTranslationVC, imageTranslationVC, keyboardTranslationVC, settingsVC]
    }
}
