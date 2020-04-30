//
//  HeroProfileTableViewCell.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class CharacterProfileTableViewCell: UITableViewCell {

  var nameOfHero: UILabel = {
    let name = UILabel()
    name.numberOfLines = 0
    name.font = UIFont(name: fontStyle, size: heroNameFontSize)
    name.textColor = .black
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  var profileHolderView: UIView = {
    let holder = UIView()
    holder.clipsToBounds = true
    holder.layer.cornerRadius = 120/2
    holder.translatesAutoresizingMaskIntoConstraints = false
    holder.applyDropShadow(shadowColor: .black)
    return holder
  }()
  
  var profileImage: UIImageView = {
    let image = UIImageView()
    image.clipsToBounds = true
    image.layer.cornerRadius = 120/2
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.backgroundColor = .clear
    self.backgroundColor = .clear
    layoutTableViewCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    
  private func layoutTableViewCell() {
    let padding: CGFloat = 10
    
    var height = nameOfHero.constraints.filter{$0.firstAttribute == .height}.first?.constant ?? 60  // height of nameOfHero
    height = height / 2
    
    contentView.addSubview(nameOfHero)
    contentView.addSubview(profileHolderView)
    profileHolderView.addSubview(profileImage)
    
    NSLayoutConstraint.activate([
      profileHolderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
      profileHolderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      profileHolderView.widthAnchor.constraint(equalToConstant: 120),
      profileHolderView.heightAnchor.constraint(equalToConstant: 120),
      
      nameOfHero.leadingAnchor.constraint(equalTo: profileHolderView.trailingAnchor, constant: padding),
      nameOfHero.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      nameOfHero.centerYAnchor.constraint(equalTo: profileHolderView.centerYAnchor),
      
      profileImage.topAnchor.constraint(equalTo: profileHolderView.topAnchor),
      profileImage.leadingAnchor.constraint(equalTo: profileHolderView.leadingAnchor),
      profileImage.bottomAnchor.constraint(equalTo: profileHolderView.bottomAnchor),
      profileImage.trailingAnchor.constraint(equalTo: profileHolderView.trailingAnchor),
      
      contentView.bottomAnchor.constraint(equalTo: nameOfHero.bottomAnchor, constant: height + 20) // 20 is for the padding of the bottom of the cell
    ])
  }
  
  
  //MARK:- Helpers
  func setData(character: Character?) {
    nameOfHero.text = character?.name
    
    guard let path = character?.thumbnail?.path, let ext = character?.thumbnail?.fileExtension else { return }
    let url = URL(string: "\(path).\(ext)")!
    profileImage.sd_setImage(with: url, placeholderImage: nil, options: .continueInBackground, context: nil)
  }
}
