//
//  SearchBlogAPI.swift
//  SearchDaumBlog
//
//  Created by SooRin Kim on 2022/02/28.
//

import Foundation

struct SearchBlogAPI {
    static let scheme = "https"
    static let host = "dapi.kakao.com"
    static let path = "/v2/search/"
    
    func searchBlog(query: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SearchBlogAPI.scheme
        components.host = SearchBlogAPI.host
        components.path = SearchBlogAPI.path + "blog"
        
        components.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "size", value: "25")
        ]
        
        return components
    }
}
