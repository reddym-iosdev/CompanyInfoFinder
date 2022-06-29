//
//  CompaniesDataSource.swift
//  CompanyFinder
//
//  Created by Reddy M on 24/06/2022.
//

import Foundation
import UIKit

class CompaniesDataSource: NSObject ,UITableViewDataSource {
    
    var companies = [Item]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return companies.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let company = companies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = company.title
        config.secondaryText = company.addressSnippet
        
        cell.contentConfiguration = config
        return cell
    }
}
