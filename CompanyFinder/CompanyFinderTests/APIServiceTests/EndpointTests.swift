//
//  EndpointTests.swift
//  CompanyFinderTests
//
//  Created by Reddy M on 23/06/2022.
//

import XCTest
@testable import CompanyFinder

class EndpointTests: XCTestCase {
    
    var sut: Endpoint!

    override func setUpWithError() throws {
        super.setUp()
        
        sut = Endpoint.search(searchTerm: "TestCompany")
    }

    override func tearDownWithError() throws {
        super.tearDown()
        
        sut = nil
    }

    func testEndpoint_UsingValidHTTPSSchema(){
        sut = Endpoint.search(searchTerm: "TestCompany")
        XCTAssertTrue(sut.urlString.starts(with: "https"))
    }
    
    func testEndPoint_UsingValidHostName(){
        sut = Endpoint.search(searchTerm: "TestCompany")
        XCTAssertEqual(sut.url?.host, "api.companieshouse.gov.uk")
        XCTAssertTrue(sut.urlString.contains("api.companieshouse.gov.uk"))
    }
    
    func testEndpoint_SearchURLisValid(){
        
        sut = Endpoint.search(searchTerm: "TestCompany")
        let urlString = sut.urlString
        
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(urlString, "https://api.companieshouse.gov.uk/search/companies?q=TestCompany&items_per_page=100&start_index=0")
    }
    
    func testEndpoint_SearchWhenPassingEmptySearchTerm(){
        
        sut = Endpoint.search(searchTerm: "")
        XCTAssertNil(sut, "Endpoint Should be nil when no searchterm passed.")
    }

}
