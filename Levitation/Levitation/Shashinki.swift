//
//  LevitationalShashinki.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import MapKit

public class LevitationalShashinki {
    
    public init(mkmapView: MKMapView, config: FundamentalConfigurations = .defaultConfig) {
        self.mkmapView = mkmapView
        self.config = config
    }
 
    open var config: FundamentalConfigurations! { //put into initializer later
        willSet {
            propertyAnimator?.stopAnimation(true)
        }
        didSet {
            mappingShashinki.pitch = CGFloat(config.viewingAngle)
            mappingShashinki.altitude = config.altitude
        }
    }
    open var state: ShashinkiState = .hasStopped
    
    private var aviation: Levitating?
    private var propertyAnimator: UIViewPropertyAnimator?
    open var animatedCurve: UIView.AnimationCurve = .linear
    private weak var mkmapView: MKMapView?
    
    private lazy var mappingShashinki: MKMapCamera = {
        let ssk = MKMapCamera()
        ssk.pitch = CGFloat(config.viewingAngle)
        ssk.altitude = config.altitude
        return ssk
    }()
    
    open func start(aviation: Levitating) {
        self.aviation = aviation
        if UIApplication.shared.applicationState != .active {
            return
        }
        self.state = .hasStarted
        self.propertyAnimator?.stopAnimation(true)
        self.mappingShashinki.centerCoordinate = aviation.coordinate2D
        // etc.
    }
    
    private func performingAviation(_ aviation: Levitating?) {
        guard let aviation = aviation else { return }
        
        propertyAnimator = UIViewPropertyAnimator(duration: config.duration, curve: animatedCurve, animations: { [weak self] in
            guard let self = self else { return }
            self.mkmapView?.camera = self.mappingShashinki
        })
        
        propertyAnimator?.uponCompletion { [weak self] in
            // if self?.aviation ~~ aviation {
                self?.performingAviation(aviation)
            //}
        }
        propertyAnimator?.startAnimation()
    }
    
}

private extension UIViewPropertyAnimator {
    func uponCompletion(_ completionClosure: @escaping () -> Void) {
        addCompletion { _ in
            completionClosure()
        }
    }
}
