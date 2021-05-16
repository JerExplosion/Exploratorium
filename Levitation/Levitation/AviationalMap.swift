//
//  AviationalMap.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import MapKit

public class AviationalMap: MKMapView {
    
    open lazy var shashinki: LevitationalShashinki = {
        return LevitationalShashinki(mkmapView: self, config: .defaultConfig)
    }()
        
    public required init?(coder: NSCoder) {
        return nil
    }
    
}
