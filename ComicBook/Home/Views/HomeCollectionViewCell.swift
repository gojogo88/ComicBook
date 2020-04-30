//
//  HomeCollectionViewCell.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/27/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
     super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  var heroImage: UIImageView = {
    let image = UIImageView()
    image.clipsToBounds = true
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = .green
    return image
  }()
  
  
  fileprivate func setupCell() {
    let padding: CGFloat = 10
    
    contentView.addSubview(heroImage)
    
    NSLayoutConstraint.activate([
      heroImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
      heroImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      heroImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      heroImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
    ])
  }
  
}
