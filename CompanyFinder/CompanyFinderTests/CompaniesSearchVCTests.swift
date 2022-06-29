//
//  ViewControllerTests.swift
//  CompanyFinderTests
//
//  Created by Reddy M on 24/06/2022.
//

import XCTest
@testable import CompanyFinder

class CompaniesSearchVCTests: XCTestCase {
    
    var storyboard: UIStoryboard!
    var sut: CompaniesSearchVC!

    override func setUp() {
        super.setUp()
        
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "ViewController") as CompaniesSearchVC
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        super.tearDown()
        
        storyboard = nil
        sut = nil
    }
    
    func testViewControllerHasSearchBar(){
        XCTAssertNotNil(sut.searchBar,
                            "Controller should have a Search bar")
    }
    
    func testViewControllerHAsSearchBarDelegate(){
        XCTAssertNotNil(sut.searchBar.delegate, "Searchbar delegate should not be null")
    }
    
    func testViewControllerConformsToSearchBarDelegateProtocol() {
        XCTAssert(CompaniesSearchVC.conforms(to: UISearchBarDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.searchBarTextDidBeginEditing(_:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.searchBarTextDidEndEditing(_:))))
    }
    
    func testViewControllerHasTableView() {
        XCTAssertNotNil(sut.tableView,
                            "Controller should have a TableView")
    }
    
    func testTableView_DataSourceIsCompaniesDataSource() {
        XCTAssertTrue(sut.tableView.dataSource is CompaniesDataSource,
                          "TableView's data source should be a CompaniesDataSource")
    }
    
    func testTableViewHasCells(){
        let cell = sut.tableView.dequeueReusableCell(withIdentifier: "Cell")

        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'Cell'")
    }
}
