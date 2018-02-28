//
//  ListItemsCollectionView.swift
//  Listko
//
//  Created by David Tomic on 20/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

extension ListItemsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    return cell
  }
}
