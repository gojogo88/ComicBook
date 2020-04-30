//
//  CharacterComicCollectionViewCell.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class CharacterComicCollectionViewCell: UICollectionViewCell {
  
  var activity = ActivityIndicator()
  
  var comicBookCover: UIImageView = {
    let cover = UIImageView()
    cover.contentMode = .scaleAspectFit
    cover.clipsToBounds = true
    cover.layer.masksToBounds = true
    cover.translatesAutoresizingMaskIntoConstraints = false
    //cover.applyDropShadow(shadowColor: .black)
    return cover
  }()
  
  var comicTitle: UILabel = {
    let title = UILabel()
    title.numberOfLines = 0
    title.textColor = .black
    //title.applyDropShadow(shadowColor: .black)
    title.font = UIFont(name: fontStyle, size: characterComicFontSize)
    title.translatesAutoresizingMaskIntoConstraints = false
    title.textAlignment = .center
    title.text = "This is the name of the Comic"
    return title
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.applyDropShadow(shadowColor: .black)
    setupCellContent()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  fileprivate func setupCellContent() {
    let padding: CGFloat = 10
    
    contentView.addSubview(comicBookCover)
    contentView.addSubview(comicTitle)
    
    NSLayoutConstraint.activate([
      comicBookCover.topAnchor.constraint(equalTo: contentView.topAnchor),
      comicBookCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      comicBookCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      comicBookCover.heightAnchor.constraint(lessThanOrEqualToConstant: 160),
      
      comicTitle.topAnchor.constraint(equalTo: comicBookCover.bottomAnchor, constant: padding),
      comicTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      comicTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
      //comicTitle.heightAnchor.constraint(equalToConstant: 160),
      contentView.bottomAnchor.constraint(equalTo: comicTitle.bottomAnchor)
    ])
  }
  
  func setData(comic: Comic?) {
    activity.displayActivity(view: comicBookCover)
    activity.startAnimating()
    comicTitle.text = comic?.title
    guard let path = comic?.cover?.path, let ext = comic?.cover?.fileExtension else {
      comicBookCover.image = UIImage(named: defaultComicImagePlaceHolder)
      activity.stopAnimating()
      return
    }
    let url = path + "." + ext
    comicBookCover.sd_setImage(with: URL(string: url)!, placeholderImage: nil, options: .continueInBackground, progress: nil) { (image, error, cache, url) in
      self.activity.stopAnimating()
    }
  }
}
