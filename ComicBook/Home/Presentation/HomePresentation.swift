//
//  HomePresentation.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/27/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class HomePresentation: NSObject, UICollectionViewDelegate {
  weak var controller: UIViewController?
  var dataSource = HomeDataSource()
  var activity = ActivityIndicator()
  
  var collectionView: UICollectionView = {
    let flow = UICollectionViewFlowLayout()
    flow.minimumLineSpacing = 10
    flow.scrollDirection = .vertical
    let mainScreen = UIScreen.main.bounds
    flow.itemSize = CGSize(width: mainScreen.width, height: mainScreen.width)
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .white
    return collectionView
  }()
  
  func displayLayout() {
    guard let controller = controller else { return }
    
    controller.view.addSubview(collectionView)
    collectionView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
    collectionView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
    collectionView.register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: heroCell)
    
    collectionView.dataSource = dataSource
    collectionView.delegate = self
    
    dataSource.fetchData()
    activity.displayActivity(view: controller.view)
    activity.startAnimating()
    dataSource.updateUI = { [weak self] (error) in
      if let weakSelf = self, error == nil {
        DispatchQueue.main.async {
          weakSelf.collectionView.reloadData()
          weakSelf.activity.stopAnimating()
        }
      }
    }
  }
  
  
  // MARK:- CollectionView Delegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let character = dataSource.characterDataSource?.apiDataSource?.characters?[indexPath.item]
  
    let cell = collectionView.cellForItem(at: indexPath)
    cell?.animateButtonPress()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
      let detailView = CharacterDetailViewController()
      detailView.character = character
      self.controller?.navigationController?.pushViewController(detailView, animated: true)
    })
  }
}
