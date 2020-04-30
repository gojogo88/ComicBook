//
//  ComicBookDataSource.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/27/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import Foundation

struct ComicBookDataSource : Codable {
  let comics: [Comic]?
    
  enum CodingKeys: String, CodingKey{
    case comics = "results"
  }
}
