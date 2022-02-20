//
//  ExploreDataManager.swift
//  WorldScanner
//
//  Created by Max on 2/14/22.
//

import Foundation

class ExploreDataManager: DataManager{
    
    private var exploreItems: [ExploreItem] = []
    
    func fetch() {
       for data in loadPlist(file: "ExploreData") {
           exploreItems.append(ExploreItem(dict:data as! [String:String]))
       }
    }
    
    func numberOfExploreItems() -> Int {
       exploreItems.count
    }
    
    func exploreItem(at index: Int) -> ExploreItem {
       exploreItems[index]
    }
}
