//
//  CompaniesSearchViewModel.swift
//  CompanyFinder
//
//  Created by Reddy M on 27/06/2022.
//

import Foundation

class CompaniesSearchViewModel {
    
    let apiService: APIServiceProtocol
    
    var isLoading: ObservableObject<Bool?> = ObservableObject(false)
    
    var searchResults: ObservableObject<[Item]?> = ObservableObject([])
    
    var displayMessage: ObservableObject<String> = ObservableObject("Let's start your search.")
    
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func requestCompanySearchData(searchTerm: String, companiesDataHandler: @escaping ([Item]) -> Void) {
        self.isLoading.value = true
        
        guard let endpoint = Endpoint.search(searchTerm: searchTerm) else { return }
        
        apiService.requestCompanySearchData(endpoint, completion: {[weak self] result in
            switch result{
            case .success(let companiesData):
                print(companiesData)
                
                self?.searchResults.value = companiesData.items
                
                guard let itemsPerPage = companiesData.itemsPerPage, let totalResults = companiesData.totalResults else { return }
                
                self?.displayMessage.value = "Showing \(itemsPerPage) out of \(totalResults)"
                
            case .failure(let error):
                print(error)
                self?.displayMessage.value = "Oops! Something went wrong. Try different name."
            }
            self?.isLoading.value = false
        })
    }
    
    func clearSearch(){
        searchResults.value = []
        displayMessage.value = "Let's start your search."
    }
}
