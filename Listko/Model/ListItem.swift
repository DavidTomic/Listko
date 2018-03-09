//
//  Item.swift
//  Listko
//
//  Created by David Tomic on 05/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation
import RealmSwift
import Gloss

class ListItem: Object, JsonDecodableProtocol {
  @objc dynamic var id: Int = 0
  @objc dynamic var name: String?
  
  convenience required init?(json: JSON) {
    self.init()
    
    guard let id: Int = "id" <~~ json else {
      return nil
    }
    self.id = id
    
    guard let name: String = "name" <~~ json else {
      return nil
    }
    self.name = name
  }
}
