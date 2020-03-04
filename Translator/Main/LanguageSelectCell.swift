//
//  LanguageSelectCell.swift
//  Translator
//
//  Created by Igor Leonovich on 3/4/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class LanguageSelectCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        languageLabel.textColor = Settings.colorMode == .light ? UIColor.black : UIColor.Blue.LilyWhite
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        flagImageView.image = nil
        languageLabel.text = nil
    }
    
    func setup(language: Language) {
        if let flag = language.flag {
            flagImageView.image = UIImage(named: flag)
        }
        languageLabel.text = language.name
    }
}
