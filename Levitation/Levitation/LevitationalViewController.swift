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
