//
//  MapViewController.swift
//  FindMyCar
//
//  Created by Svayam Mishra on 13/10/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let initialLocation = CLLocation(latitude: 40.4426092, longitude: -79.9454014)
        centerMapOnLocation(initialLocation)
    }
    
    let regionRadius: CLLocationDistance = 400
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

