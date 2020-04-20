//
//  GlobalFunctions.swift
//  Translator
//
//  Created by Igor Leonovich on 4/13/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
