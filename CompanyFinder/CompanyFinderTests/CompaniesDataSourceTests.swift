//
//  CompaniesDataSource.swift
//  CompanyFinderTests
//
//  Created by Reddy M on 25/06/2022.
//

import XCTest
@testable import CompanyFinder

class CompaniesDataSourceTests: XCTestCase {
    
    var sut: CompaniesDataSource!
    let tableView = UITableView()

    override func setUpWithError() throws {
        
        super.setUp()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 44
        
        sut = CompaniesDataSource()
        guard let companies = loadCompaniesForTesting() else {
            XCTFail("Company Info Not Found")
            return
        }
        sut.companies = companies
    }

    override func tearDownWithError() throws {
        
        super.tearDown()
        sut = nil
    }
    
    func testDataSourceHasCompanies() {
                
        guard let companies = loadCompaniesForTesting() else {
            XCTFail("Company Info Not Found")
            return
        }
        sut.companies = companies
        XCTAssertNotNil(sut.companies)
    }
    
    func testDataSourceHasTenCompanies() {
        
        guard let companies = loadCompaniesForTesting() else {
            XCTFail("Company Info Not Found")
            return
        }
        sut.companies = companies
        XCTAssertEqual(sut.companies.count, 10)
    }
    
    
    func testNumberOfRows() {
        let tableView = UITableView()
        
        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 10,
                           "Number of rows in table should match number of Companies")
    }
    
    func testForZeroSectionsWhenZeroCompanies(){
        
        sut.companies = []
        XCTAssertEqual(sut.numberOfSections(in: tableView), 0)
    }
    
    func testTableViewHasOneSectionWhenCompaniesArePresent(){
        XCTAssertEqual(sut.numberOfSections(in: tableView), 1)
    }
    
    func testCellForRow() {
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        let cellConfig = cell.contentConfiguration as! UIListContentConfiguration
        
        XCTAssertEqual(cellConfig.text, "ABBERLEY HALL LIMITED",
                           "The first cell should display title of first company")
        XCTAssertEqual(cellConfig.secondaryText, "Abberley Hall, Worcester, WR6 6DD",
                           "The first cell should display address snippet of first company")
    }
    
    func loadCompaniesForTesting() -> [Item]?{
        
        let searchResultsData = TestUtilities().loadStub(name: "Abberlet_ltd_response", ext: "json")
        let companySearchResultModel = try? JSONDecoder().decode(CompanySearchResultModel.self, from: searchResultsData)
        
        guard let companies = companySearchResultModel?.items else { return nil }
        return companies
    }

}
