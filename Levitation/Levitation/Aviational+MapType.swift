//
//  AviationalMap+MapType.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import MapKit

public extension AviationalMap {
    enum MapType: String, CaseIterable, Hashable, Equatable {
        case satellite
        case hybrid
        case standard
    }
}
