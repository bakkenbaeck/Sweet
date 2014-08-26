//
//  CoreDataStack.swift
//  MyMovies
//
//  Created by Konstantin Koval on 20/08/14.
//  Copyright (c) 2014 Konstantin Koval. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataStack {
  public typealias errorHandlerType = (error: NSError)->()
  private let coreDataName: String

  lazy var managedObjectModel: NSManagedObjectModel = Factory.defaultMOM(self.coreDataName)
  lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = Factory.storeCoordinator(self.coreDataName, mom: self.managedObjectModel)
  lazy var mainMOC: NSManagedObjectContext = Factory.mainMOCProvider(self.persistentStoreCoordinator)

  public var errorHandler: errorHandlerType
  
  init(name: String, errorHandler: errorHandlerType) {
    coreDataName = name
    self.errorHandler = errorHandler
  }

  convenience init() {
    self.init(name : AppInfo.productName, errorHandler: Factory.defaultErrorHandler())
  }
}

// Factory
extension CoreDataStack {

class Factory {

  class func defaultMOM(name: String) -> NSManagedObjectModel {
    let modelURL = NSBundle.mainBundle().URLForResource(name, withExtension: "momd")
    return NSManagedObjectModel(contentsOfURL: modelURL)
  }

  class func storeCoordinator(name:String, mom: NSManagedObjectModel) -> NSPersistentStoreCoordinator {

    let coordinator = NSPersistentStoreCoordinator(managedObjectModel: mom)
    var error: NSError?
    if coordinator.addPersistentStoreWithType(NSSQLiteStoreType,
      configuration: nil, URL: FileHelper.filePathURL("\(name).sqlite"), options: nil, error: &error) == nil {
      
    // FIXME: - Add error handling
    }
    return coordinator
  }

  class func mainMOCProvider (storeCoordinator:  NSPersistentStoreCoordinator) -> NSManagedObjectContext {
    let managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = storeCoordinator
    return managedObjectContext
  }

  class func defaultErrorHandler () -> CoreDataStack.errorHandlerType {
    return { error in
      NSLog("Unresolved Core Data Error \(error), \(error.userInfo)")
      abort()
    }
  }
}

}