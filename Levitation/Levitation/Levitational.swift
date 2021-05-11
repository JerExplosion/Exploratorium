//
//  Levitational.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import MapKit

extension MKMapCamera: Levitating {
    public var coordinate2D: CLLocationCoordinate2D {
        return self.centerCoordinate
    }
}

extension MKCoordinateSpan: Levitating {
    public var coordinate2D: CLLocationCoordinate2D {
        return .init(latitude: self.latitudeDelta, longitude: self.longitudeDelta)
    }
}

public protocol Levitating {
    var coordinate2D: CLLocationCoordinate2D { get }
}
