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
    
    open var config: FundamentalConfigurations! { //put into initializer later
        willSet {
            propertyAnimator?.stopAnimation(true)
        }
        didSet {
            mappingShashinki.pitch = CGFloat(config.viewingAngle)
            mappingShashinki.altitude = config.altitude
        }
    }
    
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
    
    private func performingAviation(_ aviation: Levitating?) {
        guard let aviation = aviation else { return }
        
        propertyAnimator = UIViewPropertyAnimator(duration: config.duration, curve: animatedCurve, animations: { [weak self] in
            guard let self = self else { return }
            self.mkmapView?.camera = self.mappingShashinki
        })
        
        propertyAnimator?.uponCompletion { [weak self] in
            if self?.aviation ~~ aviation {
                self?.performingAviation(aviation)
            }
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
