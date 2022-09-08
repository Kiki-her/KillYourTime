//
//  Presistence.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/07.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CoreData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
 
