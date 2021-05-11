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

public protocol Levitating {
    var coordinate2D: CLLocationCoordinate2D { get }
}
