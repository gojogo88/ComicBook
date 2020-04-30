//
//  UIView+Ext.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/29/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

extension UIView {
  func animateButtonPress() {
    UIView.animate(withDuration: 0.2, animations: {
      self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
    }, completion: { _ in
      UIView.animate(withDuration: 0.2) {
        self.transform = .identity
      }
    })
  }
  
  
  func applyDropShadow(shadowColor: UIColor) {
    self.layer.masksToBounds = false
    self.layer.shadowOpacity = 0.6
    self.layer.shadowRadius = 4
    self.layer.shadowOffset = CGSize(width: 3, height: 2)
    self.layer.shouldRasterize = true
    self.layer.rasterizationScale = UIScreen.main.scale
    self.layer.shadowColor = shadowColor.cgColor
  }
}
