//
//  APIServiceEnum.swift
//  CompanyFinder
//
//  Created by Reddy M on 22/06/2022.
//

import Foundation

public enum hostDetails: String {
    case schema = "https"
    case host = "api.companieshouse.gov.uk"
    case searchPath = "/search"
    case companySearchPath = "/search/companies"
    case apiKey = "ODkxMWRlM2YtY2ExMi00NzIzLTkxNjQtNzI1NDA3Njk1ZDExOjo="
}

public enum APIResponseError : String, Error {
    case invalidURL = "Invalid URL"
    case networkError = "Network Issue"
    case dataParsingError = "Failed to parse json data"
    case requestError = "Request Failed"
}
