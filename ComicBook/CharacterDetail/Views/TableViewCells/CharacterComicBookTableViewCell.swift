//
//  CharacterComicBookTableViewCell.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class CharacterComicBookTableViewCell: UITableViewCell {

  var dataSource = ChactacterComicsCollectionViewDataSource()
  fileprivate var activity = ActivityIndicator()
  
  var collectionView: UICollectionView = {
    let flow = UICollectionViewFlowLayout()
    flow.minimumInteritemSpacing = 10.0
    flow.scrollDirection = .horizontal
    flow.itemSize = CGSize(width: 160, height: 220)
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .clear
    return collectionView
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  
    contentView.backgroundColor = .white
    displayLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func displayLayout() {
    contentView.addSubview(collectionView)
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 310),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    
    collectionView.register(CharacterComicCollectionViewCell.self, forCellWithReuseIdentifier: comicBookCollectionCell)

    collectionView.dataSource = dataSource
    activity.displayActivity(view: contentView)
    activity.startAnimating()
    dataSource.reloadCollectionView = { [weak self] (error) in
      if let weakSelf = self, error == nil {
        DispatchQueue.main.async {
          weakSelf.activity.stopAnimating()
          weakSelf.collectionView.reloadData()
        }
      } else {
        //alert
        print("Something went wrong.")
      }
    }
  }
  
  
  //MARK:- Helpers
  func triggerDataSource(character: Character?) {
    guard let id = character?.id else {
      print("Failed to unwrap character in the tableview cell")
      return
    }
    
    dataSource.fetchComics(id: id)
  }
}
