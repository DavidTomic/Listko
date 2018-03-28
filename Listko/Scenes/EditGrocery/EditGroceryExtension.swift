//
//  EditGroceryExtension.swift
//  Listko
//
//  Created by David Tomic on 02/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit
import RxKeyboard
import RxSwift

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
  
  
  // MARK: Keyboard handling
  
  func addKeyboardObserver() {
    RxKeyboard.instance.visibleHeight
      .drive(onNext: { keyboardVisibleHeight in
        var actualKeyboardHeight = keyboardVisibleHeight
        if #available(iOS 11.0, *), keyboardVisibleHeight > 0 {
          actualKeyboardHeight = actualKeyboardHeight - self.view.safeAreaInsets.bottom
        }
        self.consToolbarBottom.constant = actualKeyboardHeight
        self.view.layoutIfNeeded()
      })
      .disposed(by: disposeBag)
  }
  
  // MARK: Large title
  
  func disableLargeTitle() {
    if #available(iOS 11.0, *) {
      navigationItem.largeTitleDisplayMode = .never
    }
  }
  
  // MARK: Table view
  
  func setupTableView() {
    registerTableViewCell()
    disableTableViewStickyHeader()
    self.tableView.isEditing = true
  }
  
  func registerTableViewCell() {
    let nibCell = UINib(nibName: "EditCell", bundle: nil)
    tableView.register(nibCell, forCellReuseIdentifier: "cell")
    tableView.keyboardDismissMode = .interactive
  }
  
  func disableTableViewStickyHeader() {
    let dummyViewHeight = CGFloat(40)
    tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: dummyViewHeight))
    tableView.contentInset = UIEdgeInsetsMake(-dummyViewHeight, 0, 0, 0)
  }
}
