//
//  CloseView.swift
//  Wekker
//
//  Created by David Tomic on 29/12/2016.
//  Copyright © 2016 David Tomic. All rights reserved.
//

import UIKit

//@IBDesignable
class CloseButton: UIButton {

    @IBInspectable
    var padding:CGFloat = 5.0
    @IBInspectable
    var lineWidth:CGFloat = 1.0
    @IBInspectable
    var color:UIColor = UIColor.white
    
    
    override func draw(_ rect: CGRect) {
        let width = bounds.size.width - padding
        let height = bounds.size.height - padding
        
        color.set()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: padding, y: padding))
        path.addLine(to: CGPoint(x: width, y: height))
        path.move(to: CGPoint(x: padding, y: height))
        path.addLine(to: CGPoint(x: width, y: padding))
        path.lineWidth = lineWidth
        path.stroke()
    }

}
