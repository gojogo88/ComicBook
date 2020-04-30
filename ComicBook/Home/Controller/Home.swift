//
//  ViewController.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/27/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class Home: UIViewController {
  let presentation = HomePresentation()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navBarStyling()
    setup()
  }

  
  fileprivate func navBarStyling() {
    navigationController?.applyStyling(titleNavBar: "Comic Characters", controller: self, barColor: .red, shouldShowbutton: false)
  }
  
  
  fileprivate func setup() {
    view.backgroundColor = .white
    presentation.controller = self
    presentation.displayLayout()
  }
  
}

