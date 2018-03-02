//
//  ListItem.swift
//  Listko
//
//  Created by David Tomic on 02/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation
import SharkORM
import Gloss

final class ListItem: SRKObject, JsonDecodableProtocol {
  
  @objc dynamic var title: String?
  @objc dynamic var items: [Item]?
  
  override init() {
    super.init()
  }
  
  init?(json: JSON) {
    super.init()
    guard let title: String = "title" <~~ json else {
      return nil
    }
    self.title = title
    
    guard let items: [Item] = "items" <~~ json else {
      return nil
    }
    self.items = items
  }
  
  
  final class Item: SRKObject, JsonDecodableProtocol {
    @objc dynamic var itemId: NSNumber?
    @objc dynamic var name: String?
    
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
}
