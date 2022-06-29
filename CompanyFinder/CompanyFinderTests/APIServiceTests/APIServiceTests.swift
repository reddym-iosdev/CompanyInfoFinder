//
//  APIServiceTests.swift
//  CompanyFinderTests
//
//  Created by Reddy M on 23/06/2022.
//

import XCTest
@testable import CompanyFinder
@testable import Alamofire

class APIServiceTests: XCTestCase {
    
    var sut: APIService!
    var expectation: XCTestExpectation!
    
    override func setUpWithError() throws {
        
        super.setUp()
        
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockURLProtocol.self] + (configuration.protocolClasses ?? [])
        let sessionManager = Session(configuration: configuration)
        
        sut = APIService(urlSession: sessionManager)
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
        sut = nil
        expectation = nil
    }
    
    func testRequestSearchDataNotNull() {
        let pageNumber = 1
        guard let endpoint = Endpoint.search(searchTerm: "Abberley Hall") else { return XCTFail("Endpoint should not be nil") }
        
        let searchResultsData = TestUtilities().loadStub(name: "Abberlet_ltd_response", ext: "json")
        TestUtilities().prepareRequestHandler(for: endpoint, with: searchResultsData)
        
        let requestExpectation = expectation(description: "Request should finish")
        sut.requestCompanySearchData(endpoint, completion: { result in
            switch result {
            case .success(let response):
                
                XCTAssertEqual(response.pageNumber, pageNumber)
                
                let firstResult = response.items?.first
                XCTAssertEqual(firstResult?.title, "ABBERLEY HALL LIMITED")
                
            case .failure(let error):
                XCTFail("Error was not expected: \(error)")
            }
            requestExpectation.fulfill()
        })
        wait(for: [requestExpectation], timeout: 1.0)
    }
    
    func testRequestSearchDataWithParsingError() {
        guard let endpoint = Endpoint.search(searchTerm: "Clario") else { return XCTFail("Endpoint should not be nil") }
        
        let searchResultsData = TestUtilities().loadStub(name: "error_response", ext: "json")
        TestUtilities().prepareRequestHandler(for: endpoint, with: searchResultsData)
        
        let requestExpectation = expectation(description: "Request should finish")
        sut.requestCompanySearchData(endpoint, completion: { result in
            switch result {
            case .success(_):
                XCTFail("Not expecting success for this test")
            case .failure(_):
                XCTAssertTrue(true, "Expecting DataParsing Error")
            }
            requestExpectation.fulfill()
        })
        wait(for: [requestExpectation], timeout: 1.0)
    }
    
}
