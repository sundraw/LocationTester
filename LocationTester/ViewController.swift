//
//  ViewController.swift
//  LocationTester
//
//  Created by Alexander Kolesnikov on 24/04/2018.
//  Copyright © 2018 Lunarium Ltd. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblError: UILabel!
    
    @IBAction func detectLocation() {
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation = locations.last
        lblLatitude.text = String(format: "%.4f", (latestLocation?.coordinate.latitude)!)
        lblLongitude.text = String(format: "%.4f", (latestLocation?.coordinate.longitude)!)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        lblHeading.text = String(format: "%.4f", newHeading.trueHeading.magnitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        lblError.text = error.localizedDescription
    }
}

