//
//  LevitationalViewController.swift
//  Levitation
//
//  Created by Jerry Ren on ~/~/21.
//

import UIKit

final class LevitationalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}

final class CirculatedButton: UIButton {
    override func awakeFromNib() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.size.height / 2
    }
}
