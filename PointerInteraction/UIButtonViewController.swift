//
//  FirstViewController.swift
//  PointerInteraction
//
//  Created by Tim Roesner on 4/11/20.
//  Copyright © 2020 Tim Roesner. All rights reserved.
//

import UIKit

class UIButtonViewController: UIViewController {
    @IBOutlet weak var highlightedButton: UIButton!
    @IBOutlet weak var smallLiftButton: UIButton!
    @IBOutlet weak var largeLiftButton: UIButton!
    @IBOutlet weak var hover1Button: UIButton!
    @IBOutlet weak var hover2Button: UIButton!
    @IBOutlet weak var hover3Button: UIButton!
    
    private lazy var allButtons: [UIButton] = [highlightedButton, smallLiftButton, largeLiftButton, hover1Button, hover2Button, hover3Button]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        smallLiftButton.layer.cornerRadius = 8
        largeLiftButton.layer.cornerRadius = 8
        hover3Button.layer.cornerRadius = 8
        
        setupPointerInteraction()
    }
    
    private func setupPointerInteraction() {
        allButtons.forEach { (button) in
            button.isPointerInteractionEnabled = true
        }
        
        highlightedButton.pointerStyleProvider = { (button, effect, shape) in
            let targetedPreview = UITargetedPreview(view: button)
            return UIPointerStyle(effect: .highlight(targetedPreview))
        }
        
        smallLiftButton.pointerStyleProvider = { (button, effect, shape) in
            let targetedPreview = UITargetedPreview(view: button)
            return UIPointerStyle(effect: .lift(targetedPreview))
        }
        
        largeLiftButton.pointerStyleProvider = { (button, effect, shape) in
            let targetedPreview = UITargetedPreview(view: button)
            return UIPointerStyle(effect: .lift(targetedPreview))
        }
        
        hover1Button.pointerStyleProvider = { (button, effect, shape) in
            let targetedPreview = UITargetedPreview(view: button)
            return UIPointerStyle(effect: .hover(targetedPreview))
        }
        
        hover2Button.pointerStyleProvider = { (button, effect, shape) in
            let targetedPreview = UITargetedPreview(view: button)
            return UIPointerStyle(effect: .hover(targetedPreview, preferredTintMode: .overlay, prefersShadow: true, prefersScaledContent: false))
        }
        
        hover3Button.pointerStyleProvider = { (button, effect, shape) in
            let targetedPreview = UITargetedPreview(view: button)
            return UIPointerStyle(effect: .hover(targetedPreview, preferredTintMode: .underlay, prefersShadow: true, prefersScaledContent: true))
        }
    }
}

