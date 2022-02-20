//
//  ExploreItem.swift
//  WorldScanner
//
//  Created by Javier on 2/14/22.
//

import Foundation

struct ExploreItem {
   let name: String?
   let image: String?
}

extension ExploreItem {
   init(dict: [String: String]) {
      self.name = dict["name"]
      self.image = dict["image"]
   }
}
