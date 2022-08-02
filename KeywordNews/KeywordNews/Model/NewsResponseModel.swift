//
//  NewsResponseModel.swift
//  KeywordNews
//
//  Created by SooRin Kim on 2022/06/05.
//

import Foundation

struct NewsResponseModel: Decodable {
    var items: [News] = []
}

struct News: Decodable {
    let title: String
    let link: String
    let description: String
    let pubDate: String
}
