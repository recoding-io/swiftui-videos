//
//  Persistence.swift
//  CD-CRUD-MVVM
//
//  Created by Haaris Iqubal on 12/29/21.
//

import Foundation
import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container:NSPersistentContainer
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "CD_CRUD_MVVM")
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
                                       if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
                                       }
        )
    }
}

