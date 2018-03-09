//
//  ListCell.swift
//  Listko
//
//  Created by David Tomic on 28/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit
import SwipeCellKit

class ListCell: SwipeTableViewCell {
  
  @IBOutlet weak var lblTitle: DemiDarkGrayLabel!
  @IBOutlet weak var lblSubTitle: RegularGrayLabel!
  
  func setup(displayItem: ListItems.Fetch.ViewModel.DisplayedListItem) {
    lblTitle.text = displayItem.title
    lblSubTitle.text = displayItem.subtitle
  }
  
}
