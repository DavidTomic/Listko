//
//  User.swift
//  Neostar
//
//  Created by David Tomic on 31/08/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import Foundation

class User {
  
  private static let user = User()
  
  static func getInstance() -> User {
    return user
  }
  
  var loggedIn: Bool {
    return false //todo
  }
  
  var authToken: String? {
    return "" //todo
  }
  
}
