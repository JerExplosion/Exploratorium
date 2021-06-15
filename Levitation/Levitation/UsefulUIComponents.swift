//
//  UsefulUIComponents.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import UIKit

final class CirculatedButton: UIButton {
    override func awakeFromNib() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.size.height / 2
    }
} 
