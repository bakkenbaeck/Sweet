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
  
  public class var documentDirectory: NSURL {
    return directoryPath(.DocumentDirectory)
  }
  
  public class func filePathURL(file :String, directory: NSSearchPathDirectory = .DocumentDirectory) -> NSURL {
    return directoryPath(directory).URLByAppendingPathComponent(file);
  }
  
  private class func directoryPath(dir: NSSearchPathDirectory) -> NSURL {
    let urls = NSFileManager.defaultManager().URLsForDirectory(dir, inDomains: .UserDomainMask)
    return urls.last! as NSURL
  }
}