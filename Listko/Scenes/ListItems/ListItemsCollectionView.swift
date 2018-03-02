//
//  ListItemsCollectionView.swift
//  Listko
//
//  Created by David Tomic on 20/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

extension ListItemsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return displayItems.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListCell
    let displayItem = displayItems[indexPath.row]
    cell.setup(displayItem: displayItem)
    return cell
  }
}
