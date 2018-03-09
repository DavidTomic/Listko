//
//  ListItem.swift
//  Listko
//
//  Created by David Tomic on 02/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation
import Gloss
import RealmSwift

class GroceryList: Object, JsonDecodableProtocol {
  
  @objc dynamic var id: Int = 0
  @objc dynamic var title: String?
  let items = List<ListItem>()
  
  convenience required init?(json: JSON) {
     self.init()
    
    guard let id: Int = "id" <~~ json else {
      return nil
    }
    self.id = id
    
    guard let title: String = "title" <~~ json else {
      return nil
    }
    self.title = title
    
    guard let items: [ListItem] = "items" <~~ json else {
      return nil
    }
    
    for item in items {
      self.items.append(item)
    }
  }
}
