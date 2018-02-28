//
//  Constants.swift
//  Listko
//
//  Created by David Tomic on 28/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation

struct Constants {
  
  struct Api {
    static let baseURL = Constants.getValueFromInfoDictionary(forKey: "SERVER_URL")
    static let authToken = "authToken"
  }
  
  static func getValueFromInfoDictionary(forKey key: String) -> String {
    return Bundle.main.object(forInfoDictionaryKey: key) as! String
  }
  
  struct Font {
    static let avenirDemi = "AvenirNext-DemiBold"
    static let avenirMedium = "AvenirNext-Medium"
    static let avenirRegular = "AvenirNext-Regular"
  }
}
