//
//  ListItemsCollectionView.swift
//  Listko
//
//  Created by David Tomic on 20/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit
import SwipeCellKit

extension ListItemsViewController: UITableViewDataSource, UITableViewDelegate, SwipeTableViewCellDelegate {
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
    if orientation == .left {
      let deleteAction = SwipeAction(style: .destructive, title: "Uredi") { action, indexPath in
        // handle action by updating model with deletion
      }
      return [deleteAction]
    } else {
      let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
        // handle action by updating model with deletion
      }
      return [deleteAction]
    }
  }
  
  func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
    swipeOptions.expansionStyle = orientation == .left ? .destructive : .none
    return swipeOptions
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayItems.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell
      cell.delegate = self
      let displayItem = displayItems[indexPath.row]
      cell.setup(displayItem: displayItem)
      return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    self.performSegue(withIdentifier: "ShowList", sender: self)
  }
  
}
