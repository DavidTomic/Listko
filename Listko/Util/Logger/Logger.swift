//
//  Logger.swift
//  Wekker
//
//  Created by David Tomic on 12/05/2017.
//  Copyright © 2017 David Tomic. All rights reserved.
//

import Foundation

protocol LogExceptionProtocol {
  func logError(type: String, info: Dictionary<String, String>?, code: Int)
}

protocol LogEventProtocol {
  func logEvent(name: String, parameters: Dictionary<String, Any>?)
}

class Logger {
  
  static var exceptionLogger: LogExceptionProtocol?
  static var eventLogger: LogEventProtocol?
  
  static func setup(exceptionLogger: LogExceptionProtocol, eventLogger: LogEventProtocol? = nil) {
    self.exceptionLogger = exceptionLogger
    self.eventLogger = eventLogger
  }
  
  static func logError(type: AppError, info: Dictionary<String, String>?, code: Int = 0) {
    print("Logger ERROR:   type: \(type), info: \(String(describing: info))")
    exceptionLogger?.logError(type: String(describing: type), info: info, code: code)
  }
  
  static func logError(type: CustomError, info: Dictionary<String, String>?, code: Int = 0) {
    exceptionLogger?.logError(type: String(describing: type), info: info, code: code)
  }
  
  static func logEvent(name: String, parameters: Dictionary<String, Any>?) {
    print("Logger EVENT:   type: \(name), info: \(String(describing: parameters))")
    eventLogger?.logEvent(name: name, parameters: parameters)
  }
}
