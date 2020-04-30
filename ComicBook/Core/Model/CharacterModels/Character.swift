//
//  Character.swift
//  ComicBook
//
//  Created by Jonathan Go on 4/27/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import Foundation

struct Character: Codable {
  let id : Int?
  let name : String?
  let description : String?
  let modified : String?
  let thumbnail : Thumbnail?
  let resourceURI : String?
  let comics : CharacterComics?
}
