//
//  PopupDismissAnimationController.swift
//  Listko
//
//  Created by David Tomic on 08/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

class PopupDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
    let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
    
    let toVCFinalFrame = transitionContext.finalFrame(for: toViewController)
    let containerView = transitionContext.containerView
    
    toViewController.view.frame = toVCFinalFrame
    toViewController.view.alpha = 0.5
    containerView.addSubview(toViewController.view)
    containerView.sendSubview(toBack: toViewController.view)
    
    let viewForSS = fromViewController.view.subviews[1]
    let snapshotView = viewForSS.snapshotView(afterScreenUpdates: false)!
    snapshotView.frame = viewForSS.frame
    containerView.addSubview(snapshotView)
    
    fromViewController.view.removeFromSuperview()
    
    UIView.animate(withDuration: transitionDuration(using: transitionContext),
                   delay: 0.0,
                   usingSpringWithDamping: 1.0,
                   initialSpringVelocity: 0.0,
                   options: .curveLinear,
   animations: {
      snapshotView.frame = fromViewController.view.frame.insetBy(dx: fromViewController.view.frame.size.width / 2,
                                                               dy: fromViewController.view.frame.size.height / 2)
      toViewController.view.alpha = 1.0
    }, completion: {
      finished in
      snapshotView.removeFromSuperview()
      transitionContext.completeTransition(true)
    })
  }
}
