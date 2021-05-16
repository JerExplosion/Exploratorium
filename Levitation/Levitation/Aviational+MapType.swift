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
    
    public init?(rawValue: RawValue) {
        switch rawValue {
        case .satelliteFlyover:
            self = .satelliteLevitation
        case .hybridFlyover:
            self = .hybridLevitation
        case .standard:
            self = .standard
        default:
            return nil
        }
    }
}
