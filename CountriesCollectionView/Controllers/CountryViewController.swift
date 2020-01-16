//
//  ViewController.swift
//  CountriesCollectionView
//
//  Created by Eric Davenport on 1/14/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
  
  @IBOutlet weak var collectionView : UICollectionView!
  @IBOutlet weak var searchBar : UISearchBar!
  
  var countries = [Country]() {
    didSet {
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    loadCountries()
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .purple
  }
  
  func loadCountries() {
    CountriesAPIClient.getCountries { [weak self] (result) in
      switch result {
      case .failure(let appError):
        print("error: \(appError)")
      case .success(let countries):
        self?.countries = countries
      }
    }
  }


}

extension CountryViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return countries.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as? CountryCell else {
      fatalError("could not downcast to countryCell")
    }
    
    let country = countries[indexPath.row]
    
    cell.configureCell(country: country)
    
    return cell
  }
}

extension CountryViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let interItemSizem : CGFloat = 10  // space between items
    let maxWidth = UIScreen.main.bounds.size.width   // devices width
    let numberOfItems: CGFloat = 3  // items
    let totalSpacing: CGFloat = numberOfItems * interItemSizem
    let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
    
    return  CGSize(width: itemWidth, height: itemWidth)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
  }
}

