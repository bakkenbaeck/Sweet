//
//  AppInfo.swift
//  MyMovies
//
//  Created by Konstantin Koval on 25/08/14.
//  Copyright (c) 2014 Konstantin Koval. All rights reserved.
//

import Foundation

public class AppInfo {
  public class var productName: String {
    return NSBundle.mainBundle().infoDictionary!["CFBundleName"] as String
  }
}