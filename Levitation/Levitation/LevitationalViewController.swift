//
//  LevitationalViewController.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import UIKit
import MapKit
import CoreLocation

final class LevitationalViewController: UIViewController, CLLocationManagerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        locationDealer.delegate = self
        flightExperiment()
        checkingLocationServices()
    }
    
    private func flightExperiment() {
        let renzu = FlyoverCamera(mapView: slyMap, configuration: FlyoverCamera.Configuration(duration: 5, altitude: 1261, pitch: 65.0, headingStep: 75))
        renzu.start(flyover: FlyoverAwesomePlace.newYork)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(222)) {
            renzu.stop()
        }
    }
    
    @IBOutlet weak var slyMap: MKMapView! {
        didSet {
            slyMap.isUserInteractionEnabled = true
            slyMap.isScrollEnabled = true
            slyMap.isZoomEnabled = true
            slyMap.isRotateEnabled = true
            slyMap.isPitchEnabled = true
            slyMap.showsBuildings = true
            slyMap.mapType = .hybridFlyover
        }
    }
    let locationDealer = CLLocationManager()
    
    internal func settingUpLocationDealer() {
        locationDealer.delegate = self
        locationDealer.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkingLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            settingUpLocationDealer()
            checkingLocationAuthorization()
        } else {
            
        }
    }
    private func checkingLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            break
        case .authorizedAlways:
            break
        case .restricted:
            break
        case .notDetermined:
            break
        case .denied:
            break
        }
    }
}

extension LevitationalViewController {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}

final class CirculatedButton: UIButton {
    override func awakeFromNib() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.size.height / 2
    }
}
