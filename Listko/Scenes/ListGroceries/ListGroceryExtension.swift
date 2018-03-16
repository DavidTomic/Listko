//
//  ListGroceryExtension.swift
//  Listko
//
//  Created by David Tomic on 28/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

extension ListGroceryViewController: UIViewControllerTransitioningDelegate {
  
  // MARK: Setup
  
  func setup()
  {
    let viewController = self
    let interactor = ListGroceryInteractor()
    let presenter = ListGroceryPresenter()
    let router = ListGroceryRouter()
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
    let nibCell = UINib(nibName: "ListCell", bundle: nil)
    tableView.register(nibCell, forCellReuseIdentifier: "cell")
    tableView.setFooterFrameToZero()
  }
  
  func setLargeTextStyle() {
    if #available(iOS 11.0, *) {
      navigationController?.navigationBar.largeTitleTextAttributes =
        [NSAttributedStringKey.foregroundColor: ColorUtil.defaultColor,
         NSAttributedStringKey.font: UIFont(name: Constants.Font.avenirDemi, size: 30)!]
    }
  }
  
  func clearNavigationBarBackground() {
    clearNavBarBackground()
  }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return popupPresentAnimationController
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return popupDismissAnimationController
  }
}
