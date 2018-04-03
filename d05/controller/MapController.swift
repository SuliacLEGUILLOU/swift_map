//
//  SecondViewController.swift
//  d05
//
//  Created by Suliac LE-GUILLOU on 4/2/18.
//  Copyright © 2018 Suliac LE-GUILLOU. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.delegate = self
        map.isRotateEnabled = false
        map.mapType = .standard
        map.register(MKPinAnnotationView.self, forAnnotationViewWithReuseIdentifier: reuseId)
        
        return map
    }()
    
    let reuseId = "weoiheoiwe"
    
    var item: CLLocationCoordinate2D? {
        didSet{
            let annotation = MKPointAnnotation()
            let baseArea = MKCoordinateSpanMake(0.1, 0.1)
            
            annotation.coordinate = item!
            let region = MKCoordinateRegion(center: annotation.coordinate, span: baseArea)
            mapView.addAnnotation(annotation)
            mapView.setRegion(region, animated: true)
        }
    }
    
    let segment: UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "standard", at: 0, animated: true)
        sc.insertSegment(withTitle: "satelite", at: 1, animated: true)
        sc.insertSegment(withTitle: "hybrid", at: 2, animated: true)
        sc.addTarget(self, action: #selector(switchMap), for: .valueChanged)
        sc.layer.cornerRadius = 5
        
        sc.backgroundColor = UIColor(white: CGFloat(0.99), alpha: CGFloat(0.5))
        
        sc.selectedSegmentIndex = 0
        sc.translatesAutoresizingMaskIntoConstraints = false
        
        return sc
    }()

    func setConstraints() {
        segment.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        segment.heightAnchor.constraint(equalToConstant: 1000)
        segment.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: segment.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tabBarItem.title = "Map"
        view.addSubview(mapView)
        view.addSubview(segment)
        
        self.title = "map"
        if item == nil {
            let schoolAnnotation = MKPointAnnotation()
            let baseArea = MKCoordinateSpanMake(0.1, 0.1)
            
            schoolAnnotation.coordinate = CLLocationCoordinate2D(latitude: 48.896847, longitude: 2.318345)
            let region = MKCoordinateRegion(center: schoolAnnotation.coordinate, span: baseArea)
            mapView.addAnnotation(schoolAnnotation)
            mapView.setRegion(region, animated: true)
        }
        setConstraints()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let view = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId, for: annotation) as? MKPinAnnotationView else { return nil }
        let random = arc4random_uniform(8)
        let colors: [UIColor] = [.blue, .orange, .red, .green, .yellow, .white, .brown, .black]
        view.pinTintColor = colors[Int(random)]
        return view
    }

}


extension MapController {
    
    @objc func switchMap() {
        switch segment.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .satellite
        default: mapView.mapType = .hybrid
        }
    }
}
