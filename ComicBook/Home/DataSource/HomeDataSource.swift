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
  var characterDataSource: CharacterBaseData?
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return characterDataSource?.apiDataSource?.characters?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: heroCell, for: indexPath) as! HeroCollectionViewCell
    
    let character = characterDataSource?.apiDataSource?.characters?[indexPath.item]
    cell.setData(character: character)
    return cell
  }
  
  
  func fetchData() {
    let request = RequestHandler().getCharacters()
    
    JSONDecoder().decoderWithRequest(CharacterBaseData.self, fromURLRequest: request) { [weak self] (result, error) in
      self?.characterDataSource = result
      self?.updateUI?(error)
    }
  }
}
