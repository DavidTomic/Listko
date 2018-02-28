//
//  CrashlyticsExceptionLogger.swift
//  Wekker
//
//  Created by David Tomic on 12/05/2017.
//  Copyright © 2017 David Tomic. All rights reserved.
//

import Foundation
import Crashlytics

class CrashlyticsExceptionLogger: LogExceptionProtocol {
  
  func logError(type: String, info: Dictionary<String, String>?, code: Int) {
    let error = NSError(domain: type, code: code, userInfo: info)
    Crashlytics.sharedInstance().recordError(error)
  }
}
