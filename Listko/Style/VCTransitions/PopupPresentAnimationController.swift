//
//  PopupTransition.swift
//  Listko
//
//  Created by David Tomic on 08/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

class PopupPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.7
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let fromViewController = transitionContext.viewController(forKey: .from)!
    let toViewController = transitionContext.viewController(forKey: .to)!
    
    let toVCFinalFrame = transitionContext.finalFrame(for: toViewController)
    let containerView = transitionContext.containerView // from controller is automatically added to containerView
    
    toViewController.view.frame = toVCFinalFrame
    containerView.addSubview(toViewController.view)
    
    let snapshotToView = toViewController.view.snapshotView(afterScreenUpdates: true)!
    snapshotToView.frame = toVCFinalFrame.insetBy(dx: toVCFinalFrame.size.width / 2, dy: toVCFinalFrame.size.height / 2)
    containerView.addSubview(snapshotToView)
    
    toViewController.view.alpha = 0.0

    let snapshotFromView = fromViewController.view.snapshotView(afterScreenUpdates: false)!
    snapshotFromView.alpha = 0.5
    snapshotFromView.frame = fromViewController.view.frame
    
    UIView.animate(withDuration: transitionDuration(using: transitionContext),
                               delay: 0.0,
                               usingSpringWithDamping: 0.7,
                               initialSpringVelocity: 0.0,
                               options: .curveLinear,
    animations: {
      fromViewController.view.alpha = 0.5
      snapshotToView.frame = toVCFinalFrame
    }, completion: {
      finished in
      toViewController.view.alpha = 1.0
      snapshotToView.removeFromSuperview()
      transitionContext.completeTransition(true) // from controller is removed from the container
      toViewController.view.addSubview(snapshotFromView)
      toViewController.view.sendSubview(toBack: snapshotFromView)
    })
  }
}

///let bounds = UIScreen.main.bounds
//    toViewController.view.frame = finalFrameForVC.insetBy(dx: finalFrameForVC.size.width / 2,
//                                                                        dy: finalFrameForVC.size.height / 2)
//    containerView.addSubview(toViewController.view)
//
//    UIView.animate(withDuration: transitionDuration(using: transitionContext),
//    animations: {
//       toViewController.view.frame = finalFrameForVC
//    }, completion: {
//      finished in
//      transitionContext.completeTransition(true)
//    })


//    UIView.animate(withDuration: transitionDuration(using: transitionContext),
//                               delay: 0.0,
//                               usingSpringWithDamping: 0.5,
//                               initialSpringVelocity: 0.0,
//                               options: .curveLinear,
//    animations: {
//      toViewController.view.frame = finalFrameForVC
//    }, completion: {
//      finished in
//      transitionContext.completeTransition(true) // from controller is removed from the container
//    })
