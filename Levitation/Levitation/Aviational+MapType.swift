//
//  AviationalMap+MapType.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import MapKit

public extension AviationalMap {
    enum MapType: String, CaseIterable, Hashable, Equatable {
        case satelliteLevitation
        case hybridLevitation
        case standard
    }
}

extension AviationalMap.MapType: RawRepresentable {
    public typealias RawValue = MKMapType
    
    public var rawValue: RawValue {
        switch self {
        case .satelliteLevitation:
            return .satelliteFlyover
        case .hybridLevitation:
            return .hybridFlyover
        case .standard:
            return .standard
        }
    }
}
