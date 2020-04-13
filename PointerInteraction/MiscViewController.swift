//
//  MiscViewController.swift
//  PointerInteraction
//
//  Created by Tim Roesner on 4/11/20.
//  Copyright © 2020 Tim Roesner. All rights reserved.
//

import UIKit

class MiscViewController: UIViewController {
    @IBOutlet weak var hoverGestureView: UIView!
    @IBOutlet weak var hoverLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hoverLabel.alpha = 0.0

        let hoverGesture = UIHoverGestureRecognizer(target: self, action: #selector(handleHover))
        hoverGestureView.addGestureRecognizer(hoverGesture)
    }
    
    @objc private func handleHover(_ gesture: UIHoverGestureRecognizer) {
        guard gesture.state == .began || gesture.state == .ended else { return }
        let newAlpha: CGFloat = gesture.state == .began ? 1.0 : 0.0
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.hoverLabel.alpha = newAlpha
        }
    }
}
