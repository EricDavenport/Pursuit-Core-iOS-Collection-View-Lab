//
//  CountryInfo.swift
//  CountriesCollectionView
//
//  Created by Eric Davenport on 1/15/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import Foundation

struct Country: Codable {
  let name: String
  let capital: String
//  let region: String
  let population: Int
//  let currencies: Currency
  var aplha2Code: String?
}

struct Currency: Codable {
  let code: String
  let name: String
  let symbol: String
}
