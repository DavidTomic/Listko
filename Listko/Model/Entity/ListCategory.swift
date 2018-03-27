//
//  ListCategory.swift
//  Listko
//
//  Created by David Tomic on 14/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation
import Gloss
import RealmSwift

class ListCategory: Object /*, JsonDecodableProtocol*/ {
  
  @objc dynamic var listCategoryId: Int = 0
  @objc dynamic var position: Int = 0
  @objc dynamic var name: String = "rest".localized
  let listItems = List<ListItem>()
  
  override static func primaryKey() -> String? {
    return "listCategoryId"
  }
  
//  convenience required init?(json: JSON) {
//    self.init()
//
//    guard let id: Int = "id" <~~ json else {
//      return nil
//    }
//    self.id = id
//
//    guard let title: String = "title" <~~ json else {
//      return nil
//    }
//    self.title = title
//
//    guard let items: [ListItem] = "items" <~~ json else {
//      return nil
//    }
//
//    for item in items {
//      self.items.append(item)
//    }
//  }
}

func ==(lhs: ListCategory, rhs: ListCategory) -> Bool
{
  return lhs.listCategoryId == rhs.listCategoryId
}
