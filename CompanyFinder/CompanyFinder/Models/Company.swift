//
//  Company.swift
//  CompanyFinder
//
//  Created by Reddy M on 24/06/2022.
//

import Foundation

//struct Company: Codable {
//    let companyType: CompanyType
//    let descriptionIdentifier: [DescriptionIdentifier]
//    let title, dateOfCreation: String
//    let matches: Matches
//    let companyNumber: String
//    let kind: Kind
//    let companyStatus: CompanyStatus
//    let links: Links
//    let itemDescription, snippet: String
//    let address: Address
//    let addressSnippet: String
//    let dateOfCessation: String?
//
//    enum CodingKeys: String, CodingKey {
//        case companyType = "company_type"
//        case descriptionIdentifier = "description_identifier"
//        case title
//        case dateOfCreation = "date_of_creation"
//        case matches
//        case companyNumber = "company_number"
//        case kind
//        case companyStatus = "company_status"
//        case links
//        case itemDescription = "description"
//        case snippet, address
//        case addressSnippet = "address_snippet"
//        case dateOfCessation = "date_of_cessation"
//    }
//}
//
//// MARK: - Address
//struct Address: Codable {
//    let addressLine1, premises, postalCode: String
//    let locality, region, addressLine2, country: String?
//
//    enum CodingKeys: String, CodingKey {
//        case addressLine1 = "address_line_1"
//        case premises
//        case postalCode = "postal_code"
//        case locality, region
//        case addressLine2 = "address_line_2"
//        case country
//    }
//}
//
//enum CompanyStatus: String, Codable {
//    case active = "active"
//    case dissolved = "dissolved"
//}
//
//enum CompanyType: String, Codable {
//    case llp = "llp"
//    case ltd = "ltd"
//    case privateLimitedGuarantNsc = "private-limited-guarant-nsc"
//}
//
//enum DescriptionIdentifier: String, Codable {
//    case dissolvedOn = "dissolved-on"
//    case incorporatedOn = "incorporated-on"
//}
//
//enum Kind: String, Codable {
//    case searchresultsCompany = "searchresults#company"
//}
//
//// MARK: - Links
//struct Links: Codable {
//    let linksSelf: String
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//    }
//}
//
//// MARK: - Matches
//struct Matches: Codable {
//    let title: [Int]
//    let snippet: [JSONAny]
//}
