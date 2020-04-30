//
//  CharacterDetailTableViewCell.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class CharacterBioTableViewCell: UITableViewCell {

  var bio: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 15, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    return label
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.backgroundColor = .clear
    self.backgroundColor = .clear
    displayLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func displayLayout() {
    let padding: CGFloat = 10
    
    contentView.addSubview(bio)
    
    NSLayoutConstraint.activate([
      bio.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
      bio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      bio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      contentView.bottomAnchor.constraint(equalTo: bio.bottomAnchor, constant: padding)
    ])
  }

  
  //MARK:- Helpers
  func setData(character: Character?) {
    if character?.description == "" {
      bio.text = defaultBioText
    } else {
      bio.text = character?.description
    }
  }
}
