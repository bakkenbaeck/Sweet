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
    var selfBundle = NSBundle.mainBundle()
    let dic = selfBundle.infoDictionary
    if let let_dic = dic {
      return let_dic["CFBundleName"] as! String
    }
    assertionFailure("can't get CFBundleName")
  }
}