//
//  ViewController.swift
//  CompanyFinder
//
//  Created by Reddy M on 22/06/2022.
//

import UIKit

class CompaniesSearchVC: UIViewController {
    
    lazy var viewModel: CompaniesSearchViewModel = {
        return CompaniesSearchViewModel()
    }()
    
    private var companiesDataSource = CompaniesDataSource()

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = companiesDataSource
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewModel()
    }
    
    func initViewModel() {
        viewModel.searchResults.bind{ [weak self] result in
            guard let companiesList = result else {
                print("Failed to get data")
                return
            }
            self?.companiesDataSource.companies = companiesList
            self?.tableView.reloadData()
        }
        
        viewModel.displayMessage.bind{ [weak self] message in
            self?.infoLabel.text = message
        }
        
        viewModel.isLoading.bind{ [weak self] status in
            
            guard let loadingStatus = status else { return }
            
            loadingStatus ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
        }
    }

}

extension CompaniesSearchVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        
        searchBar.text = nil
        searchBar.resignFirstResponder()
        self.searchBar.showsCancelButton = false
        
        viewModel.clearSearch()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        guard let searchTerm = searchBar.text else {return}
        
        viewModel.clearSearch()
        
        viewModel.requestCompanySearchData(searchTerm: searchTerm, companiesDataHandler: {result in
            print("Contents: \(result)")
        })
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchActive = true;
        self.searchBar.showsCancelButton = true
    }
}

