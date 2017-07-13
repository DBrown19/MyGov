//
//  SecondViewController.swift
//  MyGov
//
//  Created by David Brown on 7/10/17.
//  Copyright © 2017 David Brown. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var Map: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func openMapForPlace() {
            
            let latitude: CLLocationDegrees = 0
            let longitude: CLLocationDegrees = 0
            /*
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "Place Name"
            mapItem.openInMaps(launchOptions: options)
 */
            //self.Map.centerCoordinate (latitude, longitude)
        }
        
        
    }
    
        //let position = CLLocationCoordinate2D(latitude: 98.5795, longitude: 39.8283)
        
        /*
        let Lat = 98.5795
        let Long = 39.8283
        let center = CLLocationCoordinate2D(latitude: Lat, longitude: Long)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.Map.setRegion(region, animated: true)
 */
        
        /*
      //  mapV.mapType = MKMapType.Standard
        let location = CLLocationCoordinate2D(latitude: 98.5795,longitude: 39.8283)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        // var location = CLLocationCoordinate2DMake(98.5795, 39.8283)
        
     */
        
        // Do any additional setup after loading the view, typically from a nib.
        
     //   var region: MKCoordinateRegion { }
    


        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

