//
//  CharacterBaseData.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/27/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import Foundation

struct CharacterBaseData: Codable {
  let responseCode: Int?
  let apiDataSource: CharacterDataSource?
    
  enum CodingKeys: String, CodingKey{
    case responseCode = "code"
    case apiDataSource = "data"
  }
}
