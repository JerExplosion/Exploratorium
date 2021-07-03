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
        zoomingOntoUserLocation()
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
            slyMap.mapType = .satelliteFlyover
        }
    }
    let locationDealer = CLLocationManager()
    private let region1DMetrics: Double = 12121.2
    
    internal func settingUpLocationDealer() {
        locationDealer.delegate = self
        locationDealer.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func zoomingOntoUserLocation() {
        if let locus = locationDealer.location?.coordinate {
            let region2D = MKCoordinateRegion(center: locus, latitudinalMeters: region1DMetrics, longitudinalMeters: region1DMetrics)
            slyMap.setRegion(region2D, animated: true)
        }
    }
    
    private func checkingLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            settingUpLocationDealer()
            checkingLocationAuthorization()
        } else {
            // kindly tell 'em to turn location services on across the device, in settings
        }
    }
    private func checkingLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            slyMap.showsUserLocation = true
            zoomingOntoUserLocation()
            locationDealer.startUpdatingLocation()
            break
        case .authorizedAlways:
            break
        case .restricted:
            break
        case .notDetermined:
            locationDealer.requestWhenInUseAuthorization()
        case .denied:
            break
        }
    }
}

extension LevitationalViewController {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkingLocationAuthorization()
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastKnownLocation = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: lastKnownLocation.coordinate.latitude, longitude: lastKnownLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: region1DMetrics, longitudinalMeters: region1DMetrics)
        slyMap.setRegion(region, animated: true)
    }
}
