//
//  EditGroceryTableView.swift
//  Listko
//
//  Created by David Tomic on 05/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit
import SnapKit

extension EditGroceryViewController: UITableViewDataSource, UITableViewDelegate, EditCellProtocol {
  
  func setupTableView() {
    let nibCell = UINib(nibName: "EditCell", bundle: nil)
    tableView.register(nibCell, forCellReuseIdentifier: "cell")
    tableView.keyboardDismissMode = .interactive
    
    let dummyViewHeight = CGFloat(40)
    tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: dummyViewHeight))
    tableView.contentInset = UIEdgeInsetsMake(-dummyViewHeight, 0, 0, 0)
    
    self.tableView.isEditing = true
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let key = sections[section]
    let model = displayedItems[key]!
    return model.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 45
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("cellForRowAt \(indexPath)")
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EditCell
    cell.indexPath = indexPath
    cell.delegate = self
    
    let key = sections[indexPath.section]
    let model = displayedItems[key]!
    
    cell.setup(displayItem: model[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let width = tableView.frame.width
    let height = tableView.sectionHeaderHeight
    let view = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(width), height: height))
    view.tag = section
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sectionClicked(_:)))
    view.addGestureRecognizer(tapGesture)
    
    let lblSection = UILabel()
    view.addSubview(lblSection)
    lblSection.snp.makeConstraints { (make) in
      make.left.equalTo(view).offset(5)
      make.bottom.equalTo(view).offset(-5)
    }
    
    lblSection.textColor = ColorUtil.defaultColor
    lblSection.font = UIFont(name: Constants.Font.avenirDemi, size: 14)
    lblSection.text = sections[section]
    
    return view
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  
  func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    
  }
  
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
    return .none
  }
  
  func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
    return false
  }
  
  @objc func sectionClicked(_ gestureRecognizer: UIGestureRecognizer) {
    print("sectionClicked \(gestureRecognizer.view!.tag)")
  }
  
  func addTableViewFooter(height: CGFloat) {
    print("todo addTableViewFooter \(height)")
    //let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: height))
    //tableView.tableFooterView = footerView
  }
  
  func removeTableViewFooter() {
    tableView.tableFooterView = nil
  }
  
  func editCellReturnKeyPressed(indexPath: IndexPath) {
//    let iniedtListItem = EditGrocery.DisplayedListItem(name: "")
//    displayItems[sections[0]]?.append(initListItem)
//    let newIndexPath = IndexPath(row: indexPath.row + 1, section: indexPath.section)
//    tableView.insertRows(at: [newIndexPath], with: UITableViewRowAnimation.automatic)
//    let newCell = tableView.cellForRow(at: newIndexPath) as! EditCell
//    newCell.tfItem.becomeFirstResponder()
  }
}
