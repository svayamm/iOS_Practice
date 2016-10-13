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
    
    let location = Location()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        location.getCurrentLocation()
        let initialLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        centerMapOnLocation(initialLocation)
        let droppedPin = MKPointAnnotation()
        droppedPin.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        droppedPin.title = "You Are Here"
        mapView.addAnnotation(droppedPin)
    }
    
    let regionRadius: CLLocationDistance = 350
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

