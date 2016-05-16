//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Derek on 5/15/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.50)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        
        //Programtically adds constraints to View's superViews
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("map view loaded")
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([ .Hour, .Minute, .Second], fromDate: date)
        let hour = components.hour
        
        
        if hour > 19 || hour < 7
        {
            UINavigationBar.appearance().tintColor = UIColor.blackColor()
            tabBarController!.tabBar.barTintColor = UIColor.blackColor().colorWithAlphaComponent(0.25)
        }
        
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        
        case 1:
            mapView.mapType = .Hybrid
        
        case 2:
            mapView.mapType = .Satellite
        
        default: break
        }
    }
    
    
}