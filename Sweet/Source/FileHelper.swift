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
  
  public class func getfilePath(fileName :String, directory: NSSearchPathDirectory = .DocumentDirectory) -> NSString {
    //let path = directoryPath(directory).URLByAppendingPathComponent(fileName).absoluteString!

    var error: NSError?
//    if !(NSFileManager.defaultManager().fileExistsAtPath(path)) {
//      let res = NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil, error: &error)
//      println(res)
//    }
    
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
    let documentsDirectory = paths.objectAtIndex(0) as NSString
    let path = directoryPath(directory)
    
    let path1 = documentsDirectory.stringByAppendingPathComponent("MyFile.plist")
    
    error = nil
    if !(NSFileManager.defaultManager().fileExistsAtPath(path1)) {
      let res = NSFileManager.defaultManager().createDirectoryAtPath(path1, withIntermediateDirectories: true, attributes: nil, error: &error)
      println(res)
    }

    return ""
  }
  
  private class func directoryPath(dir: NSSearchPathDirectory) -> String {
    return NSSearchPathForDirectoriesInDomains(dir, .UserDomainMask, true).first as String
  }
}