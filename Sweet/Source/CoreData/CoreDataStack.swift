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
  
  private let coreDataName: String

  lazy var managedObjectModel: NSManagedObjectModel = Factory.defaultMOM(self.coreDataName)
  lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = Factory.storeCoordinator(self.coreDataName, mom: self.managedObjectModel)
  public lazy var mainMOC: NSManagedObjectContext = Factory.mainMOCProvider(self.persistentStoreCoordinator)
  
  public init(name: String) {
    coreDataName = name
  }

  public convenience init() {
    self.init(name : AppInfo.productName)
  }
}

//MARK: - Error Handler
public class ErrorHandler {
  public typealias errorHandlerType = (NSError)->()
  public lazy var defaultErrorHandler: errorHandlerType = CoreDataStack.Factory.defaultErrorHandler()


  public init(errorHandler: errorHandlerType) {
    self.defaultErrorHandler = errorHandler
  }

  public convenience init() {
    self.init(errorHandler: CoreDataStack.Factory.defaultErrorHandler())
  }

// MARK: - Singleton
  public class var sharedInstance : ErrorHandler {
    struct Static {
      static let instance = ErrorHandler()
    }
    return Static.instance
  }
}

//MARK: - Factory
extension CoreDataStack {

class Factory {

  class func defaultMOM(name: String) -> NSManagedObjectModel {
    let modelURL = NSBundle.mainBundle().URLForResource(name, withExtension: "momd")
    return NSManagedObjectModel(contentsOfURL: modelURL)
  }

  class func storeCoordinator(name:String, mom: NSManagedObjectModel) -> NSPersistentStoreCoordinator {

    let coordinator = NSPersistentStoreCoordinator(managedObjectModel: mom)
    var error: NSError?
    if coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: FileHelper.filePathURL("\(name).sqlite"), options: nil, error: &error) == nil {
      ErrorHandler.sharedInstance.defaultErrorHandler(error!)
    }
    return coordinator
  }

  class func mainMOCProvider (storeCoordinator:  NSPersistentStoreCoordinator) -> NSManagedObjectContext {
    let managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = storeCoordinator
    return managedObjectContext
  }

  class func defaultErrorHandler () -> ErrorHandler.errorHandlerType {
    return { error in
      NSLog("Unresolved Core Data Error \(error), \(error.userInfo)")
      abort()
    }
  }
}

}