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
}

final class CirculatedButton: UIButton {
    override func awakeFromNib() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.size.height / 2
    }
}
