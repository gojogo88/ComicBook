//
//  HeroCollectionViewCell.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/27/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit
import SDWebImage

class HeroCollectionViewCell: UICollectionViewCell {
  
  var heroImage: UIImageView = {
    let image = UIImageView()
    image.clipsToBounds = true
    image.contentMode = .scaleToFill
    image.translatesAutoresizingMaskIntoConstraints = false
    image.layer.cornerRadius = 16
    return image
  }()
  
  var nameContainer: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(white: 0, alpha: 0.7)
    return view
  }()
  
  var heroNameTitle: UILabel = {
    let title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.textColor = .white
    title.numberOfLines = 1
    title.font = UIFont(name: fontStyle, size: heroNameFontSize)
    return title
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupCell()
    contentView.applyDropShadow(shadowColor: .black)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  fileprivate func setupCell() {
    let padding: CGFloat = 10
    
    contentView.addSubview(heroImage)
    heroImage.addSubview(nameContainer)
    nameContainer.addSubview(heroNameTitle)
    
    NSLayoutConstraint.activate([
      heroImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
      heroImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      heroImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      heroImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
      
      nameContainer.leadingAnchor.constraint(equalTo: heroImage.leadingAnchor),
      nameContainer.trailingAnchor.constraint(equalTo: heroImage.trailingAnchor),
      nameContainer.bottomAnchor.constraint(equalTo: heroImage.bottomAnchor),
      nameContainer.heightAnchor.constraint(equalToConstant: 80),
      
      heroNameTitle.leadingAnchor.constraint(equalTo: nameContainer.leadingAnchor, constant: padding),
      heroNameTitle.trailingAnchor.constraint(equalTo: nameContainer.trailingAnchor, constant: -padding),
      heroNameTitle.centerYAnchor.constraint(equalTo: nameContainer.centerYAnchor)
    ])
  }
  
  func setData(character: Character?) {
    heroNameTitle.text = character?.name
    guard let path = character?.thumbnail?.path, let fileExtension = character?.thumbnail?.fileExtension else { return }
    let url = path + "." + fileExtension
    
    heroImage.sd_setImage(with: URL(string: url)!, placeholderImage: nil, options: .continueInBackground, context: nil)
  }
}
