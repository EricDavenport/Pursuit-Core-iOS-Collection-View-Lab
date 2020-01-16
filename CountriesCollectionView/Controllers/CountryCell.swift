//
//  CountryCell.swift
//  CountriesCollectionView
//
//  Created by Eric Davenport on 1/16/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import UIKit

class CountryCell: UICollectionViewCell {
  
  var country : Country!
  
  @IBOutlet weak var flagImage : UIImageView!
  @IBOutlet weak var nameLabel : UILabel!
  @IBOutlet weak var capitalLabel : UILabel!
  @IBOutlet weak var populationLabel : UILabel!
  
  func configureCell(country : Country) {
    nameLabel.text = country.name
    capitalLabel.text = country.capital
    populationLabel.text = country.population.description
    
    let flagURL = "https://www.countryflags.io/\(country.aplha2Code)/shiny/64.png"
    
    flagImage.getImage(with: flagURL) { [weak self] (result) in
      
      switch result {
      case .failure:
        DispatchQueue.main.async {
          self?.flagImage.image = UIImage(named: "exclamationmark.square")
        }
      case .success(let image):
        DispatchQueue.main.async {
            self?.flagImage.image = image
        }
      }
    }
  }
    
}
