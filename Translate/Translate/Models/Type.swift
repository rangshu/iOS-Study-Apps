//
//  Type.swift
//  Translate
//
//  Created by SooRin Kim on 2022/05/02.
//

import UIKit

enum `Type` {
    case source
    case target
    
    var color: UIColor {
        switch self {
        case .source: return .label
        case .target: return .mainTintColor
        }
    }
}
