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
    ErrorHandler.sharedInstance.defaultErrorHandler(error!)
  }
}