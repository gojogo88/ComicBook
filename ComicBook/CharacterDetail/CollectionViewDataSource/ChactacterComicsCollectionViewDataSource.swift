//
//  ChactacterComicsCollectionViewDataSource.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit


class ChactacterComicsCollectionViewDataSource: NSObject, UICollectionViewDataSource {
  
  var comicsData: ComicBaseData?
  var reloadCollectionView: ((Error?) -> Void)?
  
  
  func fetchComics(id: Int) {
    let request = RequestHandler().getComics(id: id)
    JSONDecoder().decoderWithRequest(ComicBaseData.self, fromURLRequest: request) { [weak self] (result, error) in
      if let weakSelf = self {
        weakSelf.comicsData = result
        weakSelf.reloadCollectionView?(error)
      } else {
        //print error
      }
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return comicsData?.apiDataSource?.comics?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: comicBookCollectionCell, for: indexPath) as! CharacterComicCollectionViewCell
    let comic = comicsData?.apiDataSource?.comics?[indexPath.item]
    cell.setData(comic: comic)
    return cell
  }
  
  
}
