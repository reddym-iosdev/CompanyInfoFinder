//
//  CompaniesSearchViewModelTests.swift
//  CompanyFinderTests
//
//  Created by Reddy M on 27/06/2022.
//

import XCTest
@testable import CompanyFinder

class CompaniesSearchViewModelTests: XCTestCase {
    
    var sut: CompaniesSearchViewModel!
    var mockAPIService: MockAPIService!
    var searchResults: CompanySearchResultModel!

    override func setUpWithError() throws {
        super.setUp()
        
        mockAPIService = MockAPIService()
        sut = CompaniesSearchViewModel(apiService: mockAPIService)
        
        // Load Stub
        let searchResultsData = TestUtilities().loadStub(name: "Abberlet_ltd_response", ext: "json")
        
        // Create JSON Decoder
        let decoder = JSONDecoder()
        
        // Decode JSON
        searchResults = try decoder.decode(CompanySearchResultModel.self, from: searchResultsData)
        
    }

    override func tearDownWithError() throws {
        super.tearDown()
        
        sut = nil
        mockAPIService = nil
        searchResults = nil
    }

    func testFetchSearchResultsIsCalled(){
        mockAPIService.searchResult = searchResults
        
        sut.requestCompanySearchData(searchTerm: "Hello", companiesDataHandler: {_ in})
        
        XCTAssert(mockAPIService.isFetchPropertiesCalled)
    }

    func testLoadingWhenFetchingSearchResults(){
        var loadingStatus = false
        mockAPIService.searchResult = searchResults
        
        sut.isLoading.bind{ [weak self] status in
            loadingStatus = self?.sut.isLoading.value ?? false
        }

        sut.requestCompanySearchData(searchTerm: "Hello", companiesDataHandler: {_ in})
        XCTAssertTrue(loadingStatus)

        mockAPIService.fetchSuccess()
        XCTAssertFalse(loadingStatus)
    }
}
