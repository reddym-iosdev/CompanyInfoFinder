//
//  MockAPIService.swift
//  CompanyFinderTests
//
//  Created by Reddy M on 27/06/2022.
//

import Foundation
@testable import CompanyFinder

class MockAPIService: APIServiceProtocol {
    
    var isFetchPropertiesCalled = false
    var searchResult: CompanySearchResultModel!
    var completeClosure: ((SearchResultsResponse) -> Void)!
    
    
    func requestCompanySearchData(_ endpoint: Endpoint, completion: @escaping (SearchResultsResponse) -> Void) {
        isFetchPropertiesCalled = true
        completeClosure = completion
    }
    
    func fetchSuccess() {
        completeClosure(.success(searchResult))
    }
    
    func fetchFail(error: NSError?) {
        completeClosure(.failure(error!))
    }
    
}
