//
//  ListGroceryRouter.swift
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

@objc protocol ListGroceryRoutingLogic
{
  func routeToEditListItem(segue: UIStoryboardSegue?)
  func routeToShowGrocery(segue: UIStoryboardSegue?)
}

protocol ListGroceryDataPassing
{
  var dataStore: ListGroceryDataStore? { get }
}

class ListGroceryRouter: NSObject, ListGroceryRoutingLogic, ListGroceryDataPassing
{
  weak var viewController: ListGroceryViewController?
  var dataStore: ListGroceryDataStore?
  
  // MARK: Routing
  
  func routeToEditListItem(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
      let destinationVC = segue.destination as! EditGroceryViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToEditList(source: dataStore!, destination: &destinationDS)
    } else {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "EditGroceryViewController") as! EditGroceryViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToEditList(source: dataStore!, destination: &destinationDS)
      navigateToEditList(source: viewController!, destination: destinationVC)
    }
  }
  
  func routeToShowGrocery(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
//      let destinationNVC = segue.destination as! UINavigationController
//      destinationNVC.transitioningDelegate = viewController
//      let destinationVC = destinationNVC.topViewController as! ShowGroceryViewController
      
      let destinationVC = segue.destination as! ShowGroceryViewController
      destinationVC.transitioningDelegate = viewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToShowGrocery(source: dataStore!, destination: &destinationDS)
    } else {
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
//      let destinationVC = storyboard.instantiateViewController(withIdentifier: "ShowGroceryViewController") as! ShowGroceryViewController
//      destinationVC.transitioningDelegate = viewController
//      var destinationDS = destinationVC.router!.dataStore!
//      passDataToShowGrocery(source: dataStore!, destination: &destinationDS)
//      navigateToShowGrocery(source: viewController!, destination: destinationVC)
    }
  }

  // MARK: Navigation
  
  func navigateToEditList(source: ListGroceryViewController, destination: EditGroceryViewController)
  {
    source.show(destination, sender: nil)
  }
  
  func navigateToShowGrocery(source: ListGroceryViewController, destination: ShowGroceryViewController)
  {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data
  
  func passDataToEditList(source: ListGroceryDataStore, destination: inout EditGroceryDataStore)
  {
    //destination.name = source.name
  }
  
  func passDataToShowGrocery(source: ListGroceryDataStore, destination: inout ShowGroceryDataStore)
  {
    //destination.name = source.name
  }
}