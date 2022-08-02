//
//  TranslateRequestModel.swift
//  Translate
//
//  Created by SooRin Kim on 2022/05/03.
//

import Foundation

struct TranslateRequestModel: Codable {
    let source: String
    let target: String
    let text: String
}
