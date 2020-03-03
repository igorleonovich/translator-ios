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
    var selectedTintColor = UIColor.white
    var normalBackgroundColor = UIColor.white
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
        setup()
    }
    
    private func setup() {
        tintColor = normalTintColor
        backgroundColor = normalBackgroundColor
    }
}

class MicrophoneButton: CustomButton {
    
    override func awakeFromNib() {
        normalTintColor = UIColor.white
        selectedTintColor = UIColor.white
        normalBackgroundColor = UIColor.Blue.DeepSkyBlue
        selectedBackgroundColor = UIColor.Green.Lima
        super.awakeFromNib()
    }
}

class CustomButtonSubView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        round()
    }
}
