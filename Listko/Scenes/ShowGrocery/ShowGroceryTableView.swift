//
//  ShowGroceryTableView.swift
//  Listko
//
//  Created by David Tomic on 14/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

extension ShowGroceryViewController: UITableViewDelegate, UITableViewDataSource {
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    return cell
  }
  
}
