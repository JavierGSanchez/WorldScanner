//
//  CatItem.swift
//  WorldScanner
//
//  Created by Javier on 2/13/22.
//

import UIKit
struct CatItem {
    var date = Date()
    var name: String?
    var modelName: String?
    var breed: String?
    var textureData: Data{
        return Data()
    }
    var photo: UIImage?
    var photoData: Data {
       guard let photo = photo, let photoData = photo.pngData() else {
          return Data()
       }
       return photoData
    }
    var uuid = UUID()
}

//MARK: - Extension
extension CatItem {
    init(cat: Cat) {
        self.date = Date()
        self.name = cat.name
        self.modelName = cat.modelName
        self.breed = cat.breed
        if let tempUuid = cat.uuid{
            self.uuid = tempUuid
        }
   }
}
