//
//  CompanyTests.swift
//  CompanyFinderTests
//
//  Created by Reddy M on 25/06/2022.
//

import XCTest
@testable import CompanyFinder

class CompanyTests: XCTestCase {

    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testCompanyHasTitle(){
        
        let company = loadACompanyForTesting()
        
        guard let companyInfo = company else {
            XCTFail("Company Info Not Found")
            return
        }
        
        XCTAssertNotNil(companyInfo)
        XCTAssertEqual(companyInfo.title, "ABBERLEY HALL LIMITED")
        XCTAssertEqual(companyInfo.itemDescription, "00602279 - Incorporated on  3 April 1958")
        XCTAssertEqual(companyInfo.companyNumber, "00602279")
        
    }
    
    func loadACompanyForTesting() -> Item?{
        
        let searchResultsData = TestUtilities().loadStub(name: "Abberlet_ltd_response", ext: "json")
        let companySearchResultModel = try? JSONDecoder().decode(CompanySearchResultModel.self, from: searchResultsData)
        
        guard let companies = companySearchResultModel?.items else { return nil }
        return companies.first
    }
    
}
