//
//  FirstViewController.swift
//  d05
//
//  Created by Suliac LE-GUILLOU on 4/2/18.
//  Copyright © 2018 Suliac LE-GUILLOU. All rights reserved.
//

import UIKit

class MainController: UITabBarController {
    
    let placeController: UINavigationController = {
        let root = PlaceController()
        let controller = UINavigationController(rootViewController: root)
        
        controller.tabBarItem.title = "Place"
        controller.tabBarItem.image = UIImage(named: "spot")
        return controller
    }()
    
    let mapController: UINavigationController = {
        let root = MapController()
        let controller = UINavigationController(rootViewController: root)
        
        controller.tabBarItem.title = "Map"
        controller.tabBarItem.image = UIImage(named: "earth")
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(white: CGFloat(0.99), alpha: CGFloat(1.0))
        
        viewControllers = [placeController, mapController]
    }


}

