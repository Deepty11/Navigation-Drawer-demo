//
//  DrawerMenuViewController.swift
//  NavigationDrawerDemo
//
//  Created by Rehnuma Reza(Deepty) on 24/3/24.
//

import UIKit

class DrawerMenuViewController: UIViewController {
    let transitionManager = DrawerTransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .custom
        transitioningDelegate = transitionManager
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    

}
