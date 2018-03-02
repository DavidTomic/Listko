//
//  Person.swift
//  Listko
//
//  Created by David Tomic on 02/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation
import SharkORM
import Gloss

final class Person: SRKObject, JsonDecodableProtocol {
  
  @objc dynamic var itemId: NSNumber?
  @objc dynamic var name : String?
  
  override init() {
    super.init()
  }
  
  init?(json: JSON) {
    super.init()
    guard let itemId: Int = "id" <~~ json else {
      return nil
    }
    self.itemId = NSNumber(value: itemId)
    
    guard let name: String = "name" <~~ json else {
      return nil
    }
    self.name = name
  }

}
