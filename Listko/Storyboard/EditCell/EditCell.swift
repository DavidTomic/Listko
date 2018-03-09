//
//  EditCell.swift
//  Listko
//
//  Created by David Tomic on 05/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation

import UIKit

protocol EditCellProtocol: class {
  func editCellReturnKeyPressed(indexPath: IndexPath)
}

class EditCell: UITableViewCell, UITextFieldDelegate {

  @IBOutlet weak var tfItem: UITextField! {
    didSet {
      tfItem.delegate = self
    }
  }
  
  var indexPath: IndexPath!
  weak var delegate: EditCellProtocol?
  
  func setup(displayItem: EditItem.ShowListItems.ViewModel.DisplayedListItem) {
    tfItem.text = displayItem.name
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    delegate?.editCellReturnKeyPressed(indexPath: self.indexPath)
    return true
  }
}
