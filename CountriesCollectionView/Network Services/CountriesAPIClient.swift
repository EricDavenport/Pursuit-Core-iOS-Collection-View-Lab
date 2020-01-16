//
//  CountriesAPIClient.swift
//  CountriesCollectionView
//
//  Created by Eric Davenport on 1/14/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import Foundation
import NetworkHelper
import ImageKit

struct CountriesAPIClient {
  
  static func getCountries(completion: @escaping (Result<[Country], AppError>) -> ()) {
    
    let endpointURLString = "https://restcountries.eu/rest/v2/name/united"
    
    guard let url = URL(string: endpointURLString) else {
      completion(.failure(.badURL(endpointURLString)))
      return
    }
    
    let request = URLRequest(url: url)
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let results = try JSONDecoder().decode([Country].self, from: data)
          
          completion(.success(results))
        } catch {
          completion(.failure(.decodingError(error)))
        }
      }
    }
  
}
}
