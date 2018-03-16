//
//  EditGroceryPresenter.swift
//  Listko
//
//  Created by David Tomic on 02/03/2018.
//  Copyright (c) 2018 Terminko. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol EditGroceryPresentationLogic
{
  func presentGroceryListToEdit(response: EditGrocery.Edit.Response)
}

class EditGroceryPresenter: EditGroceryPresentationLogic
{
  weak var viewController: EditGroceryDisplayLogic?
  
  func presentGroceryListToEdit(response: EditGrocery.Edit.Response) {
    let groceryList = response.groceryList
    var sections: [String] = []
    var displayedItems = [String : [EditGrocery.DisplayedListItem]]()
    
    let listCategories = groceryList.listCategories
    for listCategory in listCategories {
      let section = listCategory.name
      sections.append(listCategory.name)
      let listItems = listCategory.listItems
      for listItem in listItems {
        if displayedItems[section] == nil {
          var listItemArray: [EditGrocery.DisplayedListItem] = []
          let displayedItem = EditGrocery.DisplayedListItem(name: listItem.name ?? "")
          listItemArray.append(displayedItem)
          displayedItems[section] = listItemArray
        } else {
          let displayedItem = EditGrocery.DisplayedListItem(name: listItem.name ?? "")
          displayedItems[section]!.append(displayedItem)
        }
      }
    }
    
    let viewModel = EditGrocery.Edit.ViewModel(groceryName: groceryList.title,
                                               displayedListItems: displayedItems,
                                               sections: sections)
    viewController?.displayEditedGrocery(viewModel: viewModel)
  }
}
