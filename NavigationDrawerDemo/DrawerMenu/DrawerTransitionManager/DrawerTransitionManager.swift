//
//  DrawerTransitionManager.swift
//  NavigationDrawerDemo
//
//  Created by Rehnuma Reza(Deepty) on 24/3/24.
//

import UIKit

class DrawerTransitionManager: NSObject, UIViewControllerTransitioningDelegate {
    let slideManager = DrawerSlideAnimation()
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DrawerPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideManager.isPresenting = true
        return slideManager
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideManager.isPresenting = false
        return slideManager
    }
    
}
