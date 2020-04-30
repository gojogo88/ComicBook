//
//  CharacterDetailTableViewDelegate.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class CharacterDetailTableViewDelegate: NSObject, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 1 {
      return setupSectionHeader(titleForHeader: "Character Bio", tableView: tableView)
    } else if section == 2 {
      return setupSectionHeader(titleForHeader: "Comics", tableView: tableView)
    }
    
    return UIView()
  }
  
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 1 || section == 2 {
      return sectionHeaderHeight
    }
    return 0
  }
  
  
  //MARK:- Helper
  private func setupSectionHeader(titleForHeader: String, tableView: UITableView) -> UIView {
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
