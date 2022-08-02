//
//  WeatherInformation.swift
//  Weather
//
//  Created by SooRin Kim on 2022/01/14.
//

import Foundation

struct WeatherInformation: Codable {
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        weather = try container.decode([Weather].self, forKey: .weather)
        temp = try container.decode(Temp.self, forKey: .temp)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(weather, forKey: .weather)
        try container.encode(temp, forKey: .temp)
        try container.encode(name, forKey: .name)
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temp = try container.decode(Double.self, forKey: .temp)
        feelsLike = try container.decode(Double.self, forKey: .feelsLike)
        minTemp = try container.decode(Double.self, forKey: .minTemp)
        maxTemp = try container.decode(Double.self, forKey: .maxTemp)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(temp, forKey: .temp)
        try container.encode(feelsLike, forKey: .feelsLike)
        try container.encode(minTemp, forKey: .minTemp)
        try container.encode(maxTemp, forKey: .maxTemp)
    }
    
}
