//
//  DrawerSlideAnimation.swift
//  NavigationDrawerDemo
//
//  Created by Rehnuma Reza(Deepty) on 24/3/24.
//

import UIKit

class DrawerSlideAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key: UITransitionContextViewControllerKey = isPresenting ? .to : .from
        
        guard let presentedController = transitionContext.viewController(forKey: key) else { return }
        
        let containerView = transitionContext.containerView
        
        let presentedFrame = transitionContext.finalFrame(for: presentedController)
        
        let dismissedFrame = presentedFrame.offsetBy(dx: -presentedFrame.width, dy: 0)
        
        if isPresenting {
            containerView.addSubview(presentedController.view)
        }
        
        let duration = transitionDuration(using: transitionContext)
        
        let wasCancelled = transitionContext.transitionWasCancelled
        
        presentedController.view.frame = presentedFrame
        
        
        let fromFrame = isPresenting ? dismissedFrame : presentedFrame
        let toFrame = isPresenting ? presentedFrame : dismissedFrame
        
        
        UIView.animate(withDuration: duration) {
            presentedController.view.frame = toFrame
        } completion: {_ in 
            transitionContext.completeTransition(!wasCancelled)
        }
        
    }
    
    
}
