//
//  FlyoverCamera+State.swift
//  FlyoverKit

import Foundation

public extension FlyoverCamera {
    
    /// The FlyoverCamera State
    ///
    /// - started: The FlyoverCamera is started and running
    /// - stopped: The FlyoverCamera is stopped (Initial-Value)
    enum State: String, Equatable, Hashable, CaseIterable {
        /// Started
        case started
        /// Stopped
        case stopped
    }
    
}
