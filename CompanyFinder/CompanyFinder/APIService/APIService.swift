//
//  APIService.swift
//  CompanyFinder
//
//  Created by Reddy M on 23/06/2022.
//

import Foundation
import Alamofire

typealias SearchResultsResponse = (Result<CompanySearchResultModel, Error>)

protocol APIServiceProtocol {
    func requestCompanySearchData(_ endpoint: Endpoint, completion: @escaping (SearchResultsResponse) -> Void)
}

class APIService: APIServiceProtocol {
    let urlSession: Session!
    
    init(urlSession: Session = Session.default) {
        self.urlSession = urlSession
    }
    
    func requestCompanySearchData(_ endpoint: Endpoint, completion: @escaping (SearchResultsResponse) -> Void) {
        
        let headers : HTTPHeaders = ["Content-Type":"application/json", "Authorization":"Basic \(hostDetails.apiKey.rawValue)"]
        print("URL String: \(endpoint.urlString)")
        
        urlSession.request(endpoint.urlString, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: CompanySearchResultModel.self) { (response: DataResponse) in
                debugPrint(response)
                switch response.result {
                case .success(let searchResults):
                    completion(Result.success(searchResults))
                case .failure(let error):
                    print("Failed to decode results in requestCompanySearchData: \(error.localizedDescription)")
                    completion(Result.failure(APIResponseError.dataParsingError))
                }
            }
    }
    
}
