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

class ListItem: Object /*, JsonDecodableProtocol*/ {
  
  @objc dynamic var listItemId: Int = 0
  @objc dynamic var name: String?
  @objc dynamic var position: Int = 0
  @objc dynamic var count: Int = 0
  @objc dynamic var price: Int = 0
  
  
  override static func primaryKey() -> String? {
    return "listItemId"
  }
  
//  convenience required init?(json: JSON) {
//    self.init()
//
//    guard let id: Int = "id" <~~ json else {
//      return nil
//    }
//    self.id = id
//
//    guard let name: String = "name" <~~ json else {
//      return nil
//    }
//    self.name = name
//  }
}

func ==(lhs: ListItem, rhs: ListItem) -> Bool
{
  return lhs.listItemId == rhs.listItemId
}
