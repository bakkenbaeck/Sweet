//
//  CoreDataActions.swift
//  MyMovies
//
//  Created by Konstantin Koval on 20/08/14.
//  Copyright (c) 2014 Konstantin Koval. All rights reserved.
//

import Foundation
import CoreData

public func saveContext(moc: NSManagedObjectContext) {

  var error: NSError?
  if moc.hasChanges && !moc.save(&error) {
    // Replace this implementation with code to handle the error appropriately.
    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //WARNING: Add cutom error handler

    // Swift
    // WARNING: Clean up this code after testing
      
  }
}