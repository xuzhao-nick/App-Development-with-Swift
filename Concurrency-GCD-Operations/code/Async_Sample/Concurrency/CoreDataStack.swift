//
//  CoreDataStack.swift
//  Concurrency
//
//  Created by Grace Njoroge on 07/06/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import CoreData

class CoreDataStack: NSObject {
  
  static let sharedInstance = CoreDataStack()
  private override init() {}
  
  lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "Concurrency")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()
  
  func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
}
