//
//  CharacterDetailViewController.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {

  var presentation = CharacterDetailPresentation()
  var character: Character?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    navBarStyling()
    setup()
  }
    

  private func navBarStyling() {
    navigationController?.applyStyling(titleNavBar: "Character Detail", controller: self, barColor: .red, shouldShowbutton: true)
  }
    

  private func setup() {
    presentation.controller = self
    presentation.displayLayout()
  }
}
