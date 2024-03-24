//
//  ViewController.swift
//  NavigationDrawerDemo
//
//  Created by Rehnuma Reza(Deepty) on 24/3/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTappedSideBar(_ sender: Any) {
        let vc = DrawerMenuViewController()
        present(vc, animated: true)
    }

}

