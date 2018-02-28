//
//  DemiWhiteLabel.swift
//  Neostar
//
//  Created by David Tomic on 04/10/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import Foundation

import UIKit

class DemiLabel: UILabel {
  
  var colorOfText: UIColor { return UIColor.white }
  
  @objc var myText: String? {
    didSet {
      self.text = myText
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  func setup() {
    self.textColor = colorOfText
    self.font = UIFont(name: Constants.Font.avenirDemi, size: self.font.pointSize)
  }
}
