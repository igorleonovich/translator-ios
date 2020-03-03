//
//  Settings.swift
//  Translator
//
//  Created by Igor Leonovich on 3/3/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

struct Settings {
    
    static var colorMode: ColorMode {
        get {
            if let colorModeString = UserDefaults.standard.string(forKey: "colorMode") {
                return ColorMode.init(rawValue: colorModeString)!
            } else {
                return .light
            }
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "colorMode")
        }
    }
    static var proposedColorMode: ColorMode {
        if colorMode == .dark {
            return .light
        } else {
            return .dark
        }
    }
    static var basicColor: UIColor {
        return Settings.colorMode == .light ? .white : UIColor.Blue.Mirage
    }
    
    static var voiceMode: VoiceMode = .female
    static var proposedVoiceMode: VoiceMode {
        if voiceMode == .female {
            return .male
        } else {
            return .female
        }
    }
}

enum ColorMode: String {
    case light
    case dark
}

enum VoiceMode: String {
    case female
    case male
}
