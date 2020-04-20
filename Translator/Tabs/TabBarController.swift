//
//  TabBarController.swift
//  Translator
//
//  Created by Igor Leonovich on 2/27/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class TabBarController: MDVTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        mdvTabBarControllerDataSource = self
        mdvTabBarControllerDelegate = self
    }
}

extension TabBarController: MDVTabBarControllerDelegate {
    
    func tabBar(_ tabBarController: MDVTabBarController, didSelectIndex index: Int) {
        
    }
}

extension TabBarController: MDVTabBarControllerDataSource {
    
    func tabBarControllerInitialIndex() -> Int {
        return 3
    }
    
    func tabBarControllerViewControllers() -> [MDVTabbableViewController] {
        return [SpeechTranslationViewController(isModal: false),
                TextTranslationViewController(isModal: false),
                ImageTranslationViewController(isModal: false),
                KeyboardTranslationViewController(isModal: false),
                SettingsViewController()]
    }
    
    func tabBarHeight() -> CGFloat {
        return 40
    }
    
    func tabBarBackgroundColor() -> UIColor {
        return .white
    }
    
    func tabBarAnimator() -> MDVTabBarAnimatable {
        return MDVSlidingOverlayAnimator(withTabBarColors: [UIColor.white,
                                                            UIColor.white,
                                                            UIColor.white,
                                                            UIColor.white,
                                                            UIColor.white])
    }
}
