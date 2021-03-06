//
//  ListGroceryInteractor.swift
//  Listko
//
//  Created by David Tomic on 20/02/2018.
//  Copyright (c) 2018 Terminko. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListGroceryBusinessLogic
{
  func fetchListGrocery(request: ListGrocery.Fetch.Request)
}

protocol ListGroceryDataStore
{
  
}

class ListGroceryInteractor: ListGroceryBusinessLogic, ListGroceryDataStore
{
  var presenter: ListGroceryPresentationLogic?
  var worker = ListGroceryWorker()
  
  func fetchListGrocery(request: ListGrocery.Fetch.Request)
  {
    worker.fetchListGrocery(success: { (listGroceries) in
      let response = ListGrocery.Fetch.Response(listGroceries: listGroceries)
      self.presenter?.presentListGrocery(response: response)
    }) { (error) in
      self.presenter?.presentError(error: error)
    }
  }
}
