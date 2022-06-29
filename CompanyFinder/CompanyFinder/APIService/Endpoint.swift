//
//  Endpoint.swift
//  CompanyFinder
//
//  Created by Reddy M on 22/06/2022.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func search(searchTerm: String, itemsPerPage: String? = "100") -> Endpoint? {
        
        let startIndex = "0"
        
        if searchTerm.isEmpty {
            return nil
        }
        
        return Endpoint(path: hostDetails.companySearchPath.rawValue, queryItems: [
            URLQueryItem(name: "q", value: searchTerm),
            URLQueryItem(name: "items_per_page", value: itemsPerPage),
            URLQueryItem(name: "start_index", value: startIndex)
        ])
    }

    var url: URL? {
        var components = URLComponents()
        components.scheme = hostDetails.schema.rawValue
        components.host = hostDetails.host.rawValue
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
    
    var urlString: String {
        
        guard let url = url else {
            print("Found nil while reading url in Endpoint")
            return ""
        }
        let urlString = url.absoluteString
        return urlString
    }
}

