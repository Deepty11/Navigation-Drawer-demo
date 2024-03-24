//
//  DrawerPresentationController.swift
//  NavigationDrawerDemo
//
//  Created by Rehnuma Reza(Deepty) on 24/3/24.
//

import UIKit

class DrawerPresentationController: UIPresentationController {
    private lazy var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width * 0.8, height: parentSize.height)
    }
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView else { return .zero }
        
        return CGRect(origin: .zero, size: size(forChildContentContainer: presentedViewController,
                                                     withParentContainerSize: containerView.frame.size))
    }
    
    override func containerViewDidLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView else { return }
        containerView.insertSubview(dimmingView, at: 0)
        
        NSLayoutConstraint.activate([
            dimmingView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            dimmingView.topAnchor.constraint(equalTo: containerView.topAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}
