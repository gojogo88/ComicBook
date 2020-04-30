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
  var dataSource = CharacterDetailDataSource()
  
  var tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    return table
  }()
  
  func displayLayout() {
    guard let controller = controller else { return }
    
    controller.view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: controller.view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor)
    ])
    
    tableView.register(CharacterProfileTableViewCell.self, forCellReuseIdentifier: headerCell)
    tableView.register(CharacterBioTableViewCell.self, forCellReuseIdentifier: bioCell)
    tableView.register(CharacterComicBookTableViewCell.self, forCellReuseIdentifier: comicsCell)
    
    tableView.dataSource = dataSource
    dataSource.character = controller.character
    tableView.delegate = self
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 1 {
      return setupHeader(titleForHeader: "Character Bio", tableView: tableView)
    } else if section == 2 {
      return setupHeader(titleForHeader: "Comics", tableView: tableView)
    }
    
    return UIView()
  }
  
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 1 || section == 2 {
      return sectionHeaderHeight
    }
    return 0
  }
  
  private func setupHeader(titleForHeader: String, tableView: UITableView) -> UIView {
    let padding: CGFloat = 10
    
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: sectionHeaderHeight))
    headerView.backgroundColor = .red
    
    let title = UILabel()
    title.font = UIFont(name: fontStyle, size: sectionHeaderFontSize)
    title.text = titleForHeader
    title.applyDropShadow(shadowColor: .black)
    title.textColor = .white
    title.translatesAutoresizingMaskIntoConstraints = false
    
    headerView.addSubview(title)
    
    NSLayoutConstraint.activate([
      title.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: padding),
      title.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -padding),
      title.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
    ])
    
    return headerView
  }
}
