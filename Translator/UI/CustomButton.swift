//
//  CustomButton.swift
//  Translator
//
//  Created by Igor Leonovich on 3/2/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    var normalTintColor = UIColor.Blue.DeepSkyBlue
    var selectedTintColor = UIColor.clear
    var normalBackgroundColor = UIColor.clear
    var selectedBackgroundColor = UIColor.Blue.DeepSkyBlue
    var customButtonSubViewNormalColor = UIColor.Blue.LilyWhite
    
    @IBOutlet weak var customButtonSubView: CustomButtonSubView?
        
    override var isHighlighted: Bool {
        get {
            return false
        }
        set {
            DispatchQueue.main.async {
                self.backgroundColor = newValue ? self.selectedBackgroundColor : self.normalBackgroundColor
                self.customButtonSubView?.backgroundColor = newValue ? self.selectedBackgroundColor : self.customButtonSubViewNormalColor
                self.tintColor = newValue ? self.selectedTintColor : self.normalTintColor
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        round()
        update()
    }
    
    func updateColors() {
        selectedTintColor = Settings.basicColor
        normalBackgroundColor = Settings.basicColor
        customButtonSubViewNormalColor = Settings.colorMode == .light ? UIColor.Blue.LilyWhite : UIColor.Blue.LilyWhiteSemiTransparent
    }
    
    func update() {
        updateColors()
        tintColor = normalTintColor
        backgroundColor = normalBackgroundColor
        customButtonSubView?.backgroundColor = customButtonSubViewNormalColor
    }
}

class MicrophoneButton: CustomButton {
    
    override func awakeFromNib() {
        updateColors()
        super.awakeFromNib()
    }
    
    override func updateColors() {
        normalTintColor = .white
        selectedTintColor = .white
        normalBackgroundColor = UIColor.Blue.DeepSkyBlue
        selectedBackgroundColor = UIColor.Green.Lima
    }
}

class CustomButtonSubView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        round()
    }
}

class LanguageImageSubView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        round()
    }
}
