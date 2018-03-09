//
//  EditItemExtension.swift
//  Listko
//
//  Created by David Tomic on 02/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

extension EditItemViewController {
  
  // MARK: Setup
  
  func setup()
  {
    let viewController = self
    let interactor = EditItemInteractor()
    let presenter = EditItemPresenter()
    let router = EditItemRouter()
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
  
  func setupTableView() {
    let nibCell = UINib(nibName: "EditCell", bundle: nil)
    tableView.register(nibCell, forCellReuseIdentifier: "cell")
    tableView.keyboardDismissMode = .interactive
    
    let dummyViewHeight = CGFloat(40)
    tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: dummyViewHeight))
    tableView.contentInset = UIEdgeInsetsMake(-dummyViewHeight, 0, 0, 0)
  }
}
