//
//  UITextFieldBottomBorder.swift
//  Listko
//
//  Created by David Tomic on 07/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

class UITextFieldBottomBorder: UITextField {
  
  @IBInspectable
  var borderColor: UIColor = UIColor.darkGray
  @IBInspectable
  var borderWidth: CGFloat = 1.0
  
  override func draw(_ rect: CGRect) {
    let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
    let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
    
    let path = UIBezierPath()
    
    path.move(to: startingPoint)
    path.addLine(to: endingPoint)
    path.lineWidth = borderWidth
    
    borderColor.setStroke()
    
    path.stroke()
  }
  
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    setup()
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//    setup()
//  }
//
//  private func setup() {
//    let border = CALayer()
//    let width = borderWidth
//    border.borderColor = borderColor.cgColor
//    border.frame = CGRect(x: 0, y: frame.size.height - width, width:  frame.size.width, height: frame.size.height)
//
//    border.borderWidth = width
//    self.layer.addSublayer(border)
//    self.layer.masksToBounds = true
//  }
  
}
