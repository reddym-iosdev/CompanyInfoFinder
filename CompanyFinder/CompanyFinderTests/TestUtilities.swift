//
//  TestUtilities.swift
//  CompanyFinderTests
//
//  Created by Reddy M on 24/06/2022.
//

import Foundation
@testable import CompanyFinder

class TestUtilities {
    
    func loadStub(name: String, ext: String) -> Data {
        // Obtain Reference to Bundle
        let bundle = Bundle(for: type(of: self))
        
        // Ask Bundle for URL of Stub
        let url = bundle.url(forResource: name, withExtension: ext)
        
        // Use URL to Create Data Object
        return try! Data(contentsOf: url!)
    }
    
    func prepareRequestHandler(for endpoint: Endpoint, with data: Data) {
         MockURLProtocol.requestHandler = { request in
            guard let url = request.url, url == endpoint.url else {
                throw APIResponseError.requestError
            }
            
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
    }
}

