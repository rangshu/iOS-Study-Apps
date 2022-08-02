//
//  Beer.swift
//  Brewery
//
//  Created by SooRin Kim on 2022/01/23.
//

import Foundation

struct Beer: Decodable {
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
    let foodPairing: [String]?
    
    var tagLine: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashtags = tags?.map {
            "#" + $0.replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ".", with: "")
                .replacingOccurrences(of: ",", with: " #")
        }
        return hashtags?.joined(separator: " ") ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case taglineString = "tagline"
        case imageURL = "image_url"
        case brewersTips = "brewers_tips"
        case foodPairing = "food_pairing"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        taglineString = try container.decode(String.self, forKey: .taglineString)
        description = try container.decode(String.self, forKey: .description)
        brewersTips = try container.decode(String.self, forKey: .brewersTips)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        foodPairing = try container.decode([String].self, forKey: .foodPairing)
    }
}
