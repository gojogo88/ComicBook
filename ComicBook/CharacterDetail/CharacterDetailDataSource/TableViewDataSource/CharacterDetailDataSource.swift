//
//  CharacterDetailDataSource.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class CharacterDetailDataSource: NSObject, UITableViewDataSource {
  
  var character: Character?
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: headerCell, for: indexPath) as! CharacterProfileTableViewCell
      cell.setData(character: character)
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: bioCell, for: indexPath) as! CharacterBioTableViewCell
      cell.setData(character: character)
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: comicsCell, for: indexPath) as! CharacterComicBookTableViewCell
      cell.triggerDataSource(character: character)
      return cell
    }
  }
}
