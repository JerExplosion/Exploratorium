//
//  AviationalMap.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import MapKit

public class AviationalMap: MKMapView {
    
    open lazy var aviationalShashinki: LevitationalShashinki = {
        return LevitationalShashinki(mkmapView: self, config: .defaultConfig)
    }()
    
    public var aviationalMapType: MapType? {
        set {
            newValue.flatMap { self.mapType = $0.rawValue }
        }
        get {
            return MapType(rawValue: self.mapType)
        }
    }
        
    public required init?(coder: NSCoder) {
        return nil
    }
    
}
