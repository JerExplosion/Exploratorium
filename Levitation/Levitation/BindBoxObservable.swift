//
//  BindBoxObservable.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import Foundation

class BindBoxObservable<T> {
    typealias Observer = ((T) -> Void)
    private var observer: Observer?
    
    var coreVal: T {
        didSet {
            observer?(coreVal)
        }
    }
    internal init(_ coreVal: T) {
        self.coreVal = coreVal
    }
}

extension BindBoxObservable {
    func binding(observer: Observer?) {
        self.observer = observer
        observer?(coreVal)
    }
}
