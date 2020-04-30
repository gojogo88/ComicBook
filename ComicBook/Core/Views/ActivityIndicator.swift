//
//  ActivityIndicator.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/29/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class ActivityIndicator {
  var activityIndicator: UIActivityIndicatorView = {
    let activity = UIActivityIndicatorView(style: .large)
    activity.translatesAutoresizingMaskIntoConstraints = false
    activity.color = .black
    return activity
  }()
  
  func displayActivity(view: UIView) {
    view.addSubview(activityIndicator)
    
    NSLayoutConstraint.activate([
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
  
  func startAnimating() {
    activityIndicator.startAnimating()
  }
  
  func stopAnimating() {
    activityIndicator.stopAnimating()
    activityIndicator.removeFromSuperview()
  }
}
