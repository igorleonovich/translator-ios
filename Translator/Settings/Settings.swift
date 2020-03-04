//
//  Settings.swift
//  Translator
//
//  Created by Igor Leonovich on 3/3/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

struct Settings {
    
    static var offlineMode: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "offlineMode")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "offlineMode")
        }
    }
    
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
    
    static var languages = [Language]()
    
    static var upLanguage: Language {
        get {
            if let upLanguageCode = UserDefaults.standard.string(forKey: "upLanguageCode") {
                return languages.filter { $0.language == upLanguageCode }.first!
            } else {
                return Language(language: "ru", name: "Russian")
            }
        }
        set {
            UserDefaults.standard.set(newValue.language, forKey: "upLanguageCode")
        }
    }
    
    static var downLanguage: Language {
        get {
            if let downLanguageCode = UserDefaults.standard.string(forKey: "downLanguageCode") {
                return languages.filter { $0.language == downLanguageCode }.first!
            } else {
                return Language(language: "en", name: "English")
            }
        }
        set {
            UserDefaults.standard.set(newValue.language, forKey: "downLanguageCode")
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
