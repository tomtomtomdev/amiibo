//
//  EndpointApi.swift
//  Amiibo
//
//  Created by tommy yohanes on 20/08/24.
//

import Foundation

enum EndpointApi {
    case name(String),
         character(String),
         gameseries(String)
    
    var url: URL? {
        URL(string: "https://www.amiiboapi.com/api/amiibo/\(path)")
    }
}

extension EndpointApi {
    var path: String {
        switch self {
        case .name(let query):
            return "?name=\(query)"
        
        case .character(let query):
            return "?character=\(query)"
            
        case .gameseries(let query):
            return "?gameseries=\(query)"
        }
    }
}
