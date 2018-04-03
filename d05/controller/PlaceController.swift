//
//  PlaceController.swift
//  d05
//
//  Created by Suliac LE-GUILLOU on 4/2/18.
//  Copyright © 2018 Suliac LE-GUILLOU. All rights reserved.
//

import UIKit
import CoreLocation

class PlaceController: UITableViewController {
    
    let placeList = ["Paris", "Londre", "montcuq", "42"]
    let placeCoord = [
        CLLocationCoordinate2D(latitude: 48.8032, longitude: 2.7892),
        CLLocationCoordinate2D(latitude: 51.4574, longitude: 0.3117),
        CLLocationCoordinate2D(latitude: 44.2826, longitude: 1.6493),
        CLLocationCoordinate2D(latitude: 48.896847, longitude: 2.318345)
    ]
    let placeId = "blabla"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "places"
        tableView.register(PlaceCell.self, forCellReuseIdentifier: placeId)
        view.backgroundColor = .clear
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: placeId, for: indexPath) as! PlaceCell
        cell.item = placeList[indexPath.item]
        
        if indexPath.item % 2 == 1 {
            cell.backgroundColor = UIColor(white: CGFloat(0.97), alpha: CGFloat(1.0))
        } else {
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tabBarController.item = placeCoord[indexPath.item]
        guard let mapController = (tabBarController as? MainController)?.mapController.viewControllers[0] as? MapController else { return }
        mapController.item = placeCoord[indexPath.item]
        tabBarController?.selectedIndex = 1
        //navigationController?.pushViewController(mapController, animated: true)
    }
}
