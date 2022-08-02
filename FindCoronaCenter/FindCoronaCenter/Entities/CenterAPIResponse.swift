//
//  CenterAPIResponse.swift
//  FindCoronaCenter
//
//  Created by SooRin Kim on 2022/04/11.
//

import Foundation

struct CenterAPIResponse: Decodable {
    let data: [Center]
}
