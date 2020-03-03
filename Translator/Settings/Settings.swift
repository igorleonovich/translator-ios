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
    
    static var voiceMode: VoiceMode {
        get {
            if let voiceModeString = UserDefaults.standard.string(forKey: "voiceMode") {
                return VoiceMode.init(rawValue: voiceModeString)!
            } else {
                return .female
            }
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "voiceMode")
        }
    }
    static var proposedVoiceMode: VoiceMode {
        if voiceMode == .female {
            return .male
        } else {
            return .female
        }
    }
    
    static var upLanguage: Language {
        get {
            if let upLanguageCode = UserDefaults.standard.string(forKey: "upLanguageCode") {
                return Language(code: upLanguageCode)
            } else {
                return Language(code: "ru")
            }
        }
        set {
            UserDefaults.standard.set(newValue.code, forKey: "upLanguageCode")
        }
    }
    
    static var downLanguage: Language {
        get {
            if let downLanguageCode = UserDefaults.standard.string(forKey: "downLanguageCode") {
                return Language(code: downLanguageCode)
            } else {
                return Language(code: "en")
            }
        }
        set {
            UserDefaults.standard.set(newValue.code, forKey: "downLanguageCode")
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

struct Language {
    
    let code: String
}
