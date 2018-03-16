//
//  EditGroceryExtension.swift
//  Listko
//
//  Created by David Tomic on 02/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

extension EditGroceryViewController {
  
  // MARK: Setup
  
  func setup()
  {
    let viewController = self
    let interactor = EditGroceryInteractor()
    let presenter = EditGroceryPresenter()
    let router = EditGroceryRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
}