//
//  AppError.swift
//  Neostar
//
//  Created by David Tomic on 14/06/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import Foundation

enum AppError: Error {
  
  // network errors
  case responseError(String?)
  case networkFailure
  case parseObjectError
  
  func getErrorString() -> String? {
    switch self {
    case .responseError(let errorMsg):
      return errorMsg
    default: return nil
    }
  }
}

enum CustomError {

}


