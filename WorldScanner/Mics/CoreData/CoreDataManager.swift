//
//  CoreDataManager.swift
//  WorldScanner
//
//  Created by Javier on 2/13/22.
//

import Foundation
import CoreData

struct CoreDataManager {
    
   let container: NSPersistentContainer
   
    init() {
      container = NSPersistentContainer(name: "Entities")
      container.loadPersistentStores {
         (storeDesc, error) in
         error.map {
            print($0)
         }
      }
   }
    
    func addCat(_ catItem: CatItem) {
        let cat = Cat(context: container.viewContext)
        cat.date = Date()
        cat.name = catItem.name
        cat.uuid = catItem.uuid
        cat.modelName = catItem.modelName
        cat.breed = catItem.breed
        cat.textureData = catItem.textureData
        cat.photoData = catItem.photoData
                
        save()
    }
    
    func fetchCat(by identifier: Int) -> CatItem! {
       let moc = container.viewContext
       let request = Cat.fetchRequest()
        //Might need to change this predicate string to work with a UUID value
       let predicate = NSPredicate(format:"catID = %i", identifier)
       var myCat: CatItem!
       request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
       request.predicate = predicate
        
       do {
          for tempCat in try moc.fetch(request) {
              myCat = CatItem(cat: tempCat)
              break
          }
           return myCat
           
       } catch {
          fatalError("Failed to fetch reviews: \(error)")
       }
    }
    
    private func save() {
       do {
          if container.viewContext.hasChanges {
             try container.viewContext.save()
          }
       } catch let error {
          print(error.localizedDescription)
       }
    }
    
}
