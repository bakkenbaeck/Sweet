//
//  FileHelper.swift
//  MyMovies
//
//  Created by Konstantin Koval on 25/08/14.
//  Copyright (c) 2014 Konstantin Koval. All rights reserved.
//

import Foundation
enum DirectoryType {
  
}

public class FileHelper {
  
  public class var documentDirectory: String {
    return directoryPath(.DocumentDirectory)
  }
  
  public class func filePath(file :String, directory: NSSearchPathDirectory = .DocumentDirectory) -> String {
    return directoryPath(directory).stringByAppendingPathComponent(file)
  }
  
  private class func directoryPath(dir: NSSearchPathDirectory) -> String {
    return NSSearchPathForDirectoriesInDomains(dir, .UserDomainMask, true).first as String
  }
}