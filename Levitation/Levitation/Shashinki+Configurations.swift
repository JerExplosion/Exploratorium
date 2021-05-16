//
//  Shashinki+Configurations.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import CoreLocation

extension LevitationalShashinki {
    public struct FundamentalConfigurations {
        public var viewingAngle: Float
        public var headingDirection: CLLocationDirection
        public var altitude: CLLocationDistance
        public var duration: TimeInterval
        
        public init(viewingAngle: Float, headingDirection: CLLocationDirection, altitude: CLLocationDistance, duration: TimeInterval) {
            self.viewingAngle = viewingAngle
            self.headingDirection = headingDirection
            self.altitude = altitude
            self.duration = duration
        }
    }
}

public extension LevitationalShashinki.FundamentalConfigurations {
    static let defaultConfig = LevitationalShashinki.FundamentalConfigurations(
        viewingAngle: 43.0,
        headingDirection: 22.0,
        altitude: 700,
        duration: 3.8
    )
}
