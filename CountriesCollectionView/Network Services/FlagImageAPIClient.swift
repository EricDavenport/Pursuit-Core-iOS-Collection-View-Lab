//
//  FlagImageAPIClient.swift
//  CountriesCollectionView
//
//  Created by Eric Davenport on 1/16/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import Foundation
import NetworkHelper
import ImageKit

//struct FlagImageAPIClient {
//  static func loadFlag(with countryCode: String, completion: @escaping (Result<String, AppError>) -> ()) {
//    
//    let endpointURLString = "https://www.countryflags.io/\(countryCode)/shiny/64.png"
//    
//    guard let url = URL(string: endpointURLString) else {
//      completion(.failure(.badURL(endpointURLString)))
//      return
//    }
//    
//    let request = URLRequest(url: url)
//    
//    NetworkHelper.shared.performDataTask(with: request) { (result) in
//      switch result {
//      case .failure(let appError):
//        completion(.failure(.networkClientError(appError)))
//      case .success(let data):
//        do {
//          let results = try! JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
//        } catch {
//          
//        }
//      }
//    }
//  }
//  
//  
//  
//}
