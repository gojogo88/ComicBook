//
//  CharacterDetailPresentation.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class CharacterDetailPresentation: NSObject, UITableViewDelegate {
  
  weak var controller: CharacterDetailViewController?
  var characterDataSource = CharacterDetailDataSource()
  var characterTableViewDelegate = CharacterDetailTableViewDelegate()
  
  var characterDetailTableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.tableFooterView = UIView(frame: .zero)
    return table
  }()
  
  func displayLayout() {
    guard let controller = controller else { return }
    
    controller.view.addSubview(characterDetailTableView)
    
    NSLayoutConstraint.activate([
      characterDetailTableView.topAnchor.constraint(equalTo: controller.view.topAnchor),
      characterDetailTableView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
      characterDetailTableView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor),
      characterDetailTableView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor)
    ])
    
    //register cells
    registerTableViewCells()
     
    characterDetailTableView.dataSource = characterDataSource
    characterDataSource.character = controller.character
    characterDetailTableView.delegate = characterTableViewDelegate
  }
  
  
  fileprivate func registerTableViewCells() {
    characterDetailTableView.register(CharacterProfileTableViewCell.self, forCellReuseIdentifier: headerCell)
    characterDetailTableView.register(CharacterBioTableViewCell.self, forCellReuseIdentifier: bioCell)
    characterDetailTableView.register(CharacterComicBookTableViewCell.self, forCellReuseIdentifier: comicsCell)
    
  }
}
