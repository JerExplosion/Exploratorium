//
//  LevitationalShashinki.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import MapKit

public class LevitationalShashinki {
    
    public struct FundamentalConfigurations {
        public var viewingAngle: Float
        public var altitude: CLLocationDistance
        public var duration: TimeInterval
        
        public init(viewingAngle: Float, altitude: CLLocationDistance, duration: TimeInterval) {
            self.viewingAngle = viewingAngle
            self.altitude = altitude
            self.duration = duration
        }
    }
    
    private lazy var mappingShashinki: MKMapCamera = {
        let ssk = MKMapCamera()
        return ssk
    }()
    
}

