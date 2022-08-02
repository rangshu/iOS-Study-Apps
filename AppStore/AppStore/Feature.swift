//
//  Feature.swift
//  AppStore
//
//  Created by SooRin Kim on 2022/02/12.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
