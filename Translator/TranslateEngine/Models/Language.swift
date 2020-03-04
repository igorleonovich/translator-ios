//
//  Language.swift
//  Translator
//
//  Created by Igor Leonovich on 3/3/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import Foundation

public struct Language: Codable {
    public let language: String
    public let name: String
    public var flag: String? {
        switch language {
        case "be":
            return "by"
        case "en":
            return "gb"
        case "ru":
            return "ru"
        default:
            return nil
        }
    }
}

extension Language {
    
    static func updateFromServer() {
        DispatchQueue.global().async {
            SwiftGoogleTranslate.shared.languages { (data, error) in
                if let data = data {
                    Language.saveToJSON(data)
                } else if let error = error {
                    print(error)
                }
            }
        }
    }
    
    static func saveToJSON(_ data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
            let jsonData = json["data"] as? [String: Any],
            let languagesJSON = jsonData["languages"] as? [[String: Any]],
            let languageJSONData = try? JSONSerialization.data(withJSONObject: languagesJSON, options: []) {
            
            try? languageJSONData.write(to: Constants.languagesFile)
            print("Saved languages to \(Constants.languagesFile)")
        }
    }
    
    static func getFromJSON() -> [Language]? {
        if let data = try? Data(contentsOf: Constants.languagesFile) {
            return try? JSONDecoder().decode([Language].self, from: data)
        }
        return nil
    }
}
