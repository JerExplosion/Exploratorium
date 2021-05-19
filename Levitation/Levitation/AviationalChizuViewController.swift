//
//  AviationalChizuViewController.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import UIKit

open class AviationalChizuViewController: UIViewController {
    open var aviationalMapView: AviationalMap?
    
    open var aviation: Levitating? {
        didSet {
            
        }
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
