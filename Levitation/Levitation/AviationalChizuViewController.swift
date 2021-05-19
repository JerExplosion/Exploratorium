//
//  AviationalChizuViewController.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import UIKit

open class AviationalChizuViewController: UIViewController {
    open var aviationalMapView: AviationalMap
    
    open var aviation: Levitating {
        didSet {
            self.aviationalMapView.start(aviation: aviation)
        }
    }
    
    public init(aviation: Levitating,
                config: LevitationalShashinki.FundamentalConfigurations = .defaultConfig,
                mapType: AviationalMap.MapType = .standard) {
        self.aviation = aviation
        self.aviationalMapView = AviationalMap(aviationalMapType: mapType, config: config)
        super.init(nibName: nil, bundle: nil)
        self.aviationalMapView.start(aviation: aviation)
    }
    
    public required init?(coder: NSCoder) {
        return nil
    }
    deinit {
        
    }
    open override func loadView() {
        self.view = self.aviationalMapView
    }
}
