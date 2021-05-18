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
    
    public var config: LevitationalShashinki.FundamentalConfigurations {
        set {
            self.aviationalShashinki.config = newValue
        }
        get {
            return self.aviationalShashinki.config
        }
    }
        
    public required init?(coder: NSCoder) {
        return nil
    }
    
}
