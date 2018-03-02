//
//  ColumnFlowLayout.swift
//  Listko
//
//  Created by David Tomic on 28/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
  
  let cellsPerRow: Int
  let cellHeight: CGFloat
  
  override var itemSize: CGSize {
    get {
      guard let collectionView = collectionView else { return super.itemSize }
      let marginsAndInsets: CGFloat
      if #available(iOS 11.0, *) {
        marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
      } else {
        marginsAndInsets = sectionInset.left + sectionInset.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
      }
      let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
      return CGSize(width: itemWidth, height: cellHeight)
    }
    set {
      super.itemSize = newValue
    }
  }
  
  init(cellsPerRow: Int, cellHeight: CGFloat, minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, sectionInset: UIEdgeInsets = .zero) {
    self.cellsPerRow = cellsPerRow
    self.cellHeight = cellHeight
    super.init()
    
    self.minimumInteritemSpacing = minimumInteritemSpacing
    self.minimumLineSpacing = minimumLineSpacing
    self.sectionInset = sectionInset
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
    let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
    context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
    return context
  }
  
}