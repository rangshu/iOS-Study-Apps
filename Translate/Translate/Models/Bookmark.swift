//
//  Bookmark.swift
//  Translate
//
//  Created by SooRin Kim on 2022/05/01.
//

import Foundation

struct Bookmark: Codable {
    let sourceLanguage: Language
    let translatedLanguage: Language
    
    let sourceText: String
    let translatedText: String
}
