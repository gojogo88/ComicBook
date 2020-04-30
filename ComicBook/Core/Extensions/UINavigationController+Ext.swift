//
//  UINavigationController+Ext.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/27/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

extension UINavigationController {
  func applyStyling(titleNavBar: String, controller: UIViewController, barColor: UIColor, shouldShowbutton: Bool) {
    navigationBar.barTintColor = barColor
    navigationBar.barStyle = .black
    navigationBar.isTranslucent = false
    
    let title = UILabel()
    title.text = titleNavBar
    title.applyDropShadow(shadowColor: .black)
    title.textColor = .white
    title.font = UIFont(name: fontStyle, size: navBarFontSize)
    
    if shouldShowbutton {
      controller.navigationItem.leftBarButtonItems = [backButtonStyling(), fixedSpacer(space: 10), UIBarButtonItem(customView: title)]
    } else {
      controller.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: title)
    }
  }
  
  private func backButtonStyling() -> UIBarButtonItem {
    let backBtn = UIButton(type: .custom)
    backBtn.tintColor = .white
    backBtn.applyDropShadow(shadowColor: .black)
    backBtn.addTarget(self, action: #selector(popView), for: .touchUpInside)
    let backBtnImageView = UIImageView(image: UIImage(named: "back")?.withRenderingMode(.alwaysTemplate))
    backBtn.setImage(backBtnImageView.image, for: .normal)
    
    return UIBarButtonItem(customView: backBtn)
  }

  private func fixedSpacer(space: CGFloat) -> UIBarButtonItem {
    let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    spacer.width = space
    return spacer
  }
  
  // MARK:- Responder
  @objc private func popView() {
    popViewController(animated: true)
  }
}
