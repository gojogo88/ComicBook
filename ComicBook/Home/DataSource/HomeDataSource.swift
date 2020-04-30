//
//  HomeDataSource.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/27/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
  var updateUI: ((Error?) -> Void)?
  var characters = [Character]()
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return characters.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: heroCell, for: indexPath) as! HeroCollectionViewCell
    
    let character = characters[indexPath.item]
    cell.setData(character: character)
    return cell
  }
  
  
  func fetchData(pageNumber: Int) {
    let request = RequestHandler().getCharacters(pageNumber: pageNumber)
    
    JSONDecoder().decoderWithRequest(CharacterBaseData.self, fromURLRequest: request) { [weak self] (result, error) in
      if let weakSelf = self {
        if let characters = result?.apiDataSource?.characters {
          weakSelf.characters.append(contentsOf: characters)
        } else {
          // show an alert
        }
        weakSelf.updateUI?(error)
      }
    }
  }
}
