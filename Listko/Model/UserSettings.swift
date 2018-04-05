//
//  UserSettings.swift
//  Listko
//
//  Created by David Tomic on 05/04/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation

class UserSettings {
  private static let instance = UserSettings()
  private let defaults = UserDefaults.standard
  
  var showItemPrice = true
  var valute = "kn"
  
  private init() {
    load()
  }
  
  static func getInstance() -> UserSettings {
    return instance
  }
  
  // MARK: store, load object
  private let keyShowItemPrice = "keyShowItemPrice"
  private let keyValute = "keyValute"
  
  func save() {
    defaults.set(showItemPrice, forKey: keyShowItemPrice)
    defaults.set(showItemPrice, forKey: keyValute)
  }
  
  private func load() {
    if let value = defaults.value(forKey: keyShowItemPrice) as? Bool {
      showItemPrice = value
    }
    valute = defaults.string(forKey: keyValute) ?? valute
  }
}
