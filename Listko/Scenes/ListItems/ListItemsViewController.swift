//
//  ListItemsViewController.swift
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
import SharkORM

protocol ListItemsDisplayLogic: class
{
  func displayListItems(viewModel: ListItems.Fetch.ViewModel)
}

class ListItemsViewController: ParentViewController, ListItemsDisplayLogic
{
  var interactor: ListItemsBusinessLogic?
  var router: (NSObjectProtocol & ListItemsRoutingLogic & ListItemsDataPassing)?
  
  let columnLayout = ColumnFlowLayout(
    cellsPerRow: 1,
    cellHeight: 70,
    minimumInteritemSpacing: 10,
    minimumLineSpacing: 20,
    sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  )

  var displayItems: [ListItems.Fetch.ViewModel.DisplayedListItem] = []
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    setupCollectionView()
    setLargeTextStyle()
    clearNavigationBarBackground()
    fetchListItems()
    
    
//    // test
//    let p = Person()
//    p.name = "fsdf"
//    p.itemId = 3
//    p.commit()
    
    
    let listItem = ListItem()
    listItem.title = "Title Test"

    let item = ListItem.Item()
    //item.itemId = 2
    item.name = "item test"
    listItem.items = [item]
    
    listItem.commit()
    
    let results : SRKResultSet = ListItem.query().fetch()
    print("results \(results)")
  }
  
  // MARK: Actions
  
  @IBAction func addListItem(_ sender: UIButton) {
    router?.routeToEditListItem(segue: nil)
  }
  
  
  // MARK: Methods
  
  private func setLargeTextStyle() {
    if #available(iOS 11.0, *) {
      navigationController?.navigationBar.largeTitleTextAttributes =
        [NSAttributedStringKey.foregroundColor: ColorUtil.defaultColor,
         NSAttributedStringKey.font: UIFont(name: Constants.Font.avenirDemi, size: 30)!]
    }
  }
  
  private func clearNavigationBarBackground() {
    clearNavBarBackground()
  }
  
  private func fetchListItems()
  {
    let request = ListItems.Fetch.Request()
    interactor?.fetchListItems(request: request)
  }
  
  
  // MARK: Display
  
  func displayListItems(viewModel: ListItems.Fetch.ViewModel)
  {
    displayItems = viewModel.displayedListItem
    collectionView.reloadData()
  }
}
