//
//  EditGroceryTextField.swift
//  Listko
//
//  Created by David Tomic on 04/04/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit


extension EditGroceryViewController: UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    if textField == tfGroceryName {
      setTfGroceryNameReturnKeyType()
    }
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == tfGroceryName {
      if isNewGroceryList {
        moveToFirstListItem()
      } else {
        tfGroceryName.resignFirstResponder()
      }
    }
    return true
  }
  
  func moveToFirstListItem() {
    let indexPath = IndexPath(row: 0, section: 0)
    let cell = tableView.cellForRow(at: indexPath) as! EditCell
    cell.tfItem.becomeFirstResponder()
    print("cell.tfItem \(cell.tfItem.isFirstResponder)")
  }
  
  func setTfGroceryNameReturnKeyType() {
    if isNewGroceryList {
      tfGroceryName.returnKeyType = .next
    } else {
      tfGroceryName.returnKeyType = .done
    }
  }
  
  func showTfGroceryNameKeyboardIfIsNewGroceryList() {
    if isNewGroceryList {
      tfGroceryName.becomeFirstResponder()
    }
  }
  
}
