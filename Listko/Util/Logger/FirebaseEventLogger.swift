//
//  FirebaseEventLogger.swift
//  Neostar
//
//  Created by David Tomic on 04/12/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import Foundation
import FirebaseAnalytics

class FirebaseEventLogger: LogEventProtocol {

  func logEvent(name: String, parameters: Dictionary<String, Any>?) {
    Analytics.logEvent(name, parameters: parameters)
  }
}
