//
//  DataManager.swift
//  WorldScanner
//
//  Created by Javier on 2/14/22.
//

import Foundation

protocol DataManager {
   func loadPlist(file name: String) ->
   [[String: AnyObject]]
}

extension DataManager {
    
    //Generic function for loading data from a plist
   func loadPlist(file name: String) ->
   [[String:AnyObject]] {
      guard let path = Bundle.main.path(forResource: name, ofType: "plist"),
      let itemsData = FileManager.default.contents(atPath: path),
      let items = try! PropertyListSerialization.propertyList(from: itemsData, format: nil)
      as? [[String: AnyObject]] else {
         return [[:]]
      }
      return items
   }
}
