//
//  File.swift
//  
//
//  Created by 한지석 on 2023/04/19.
//

import SwiftUI

public struct FontManager {
    
    public static func registerFonts() {
        registerFont(bundle: Bundle.main, fontName: "Kavivanar-Regular", fontExtension: ".ttf") //change according to your ext.
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        print(Bundle.main)
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
