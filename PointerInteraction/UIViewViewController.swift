//
//  SecondViewController.swift
//  PointerInteraction
//
//  Created by Tim Roesner on 4/11/20.
//  Copyright © 2020 Tim Roesner. All rights reserved.
//

import UIKit

class UIViewViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var smallImageView: UIImageView!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var contextMenuButton: UIButton!
    @IBOutlet weak var shape1Button: UIButton!
    @IBOutlet weak var shape2Button: UIButton!
    @IBOutlet weak var shape3Button: UIButton!
    @IBOutlet weak var shape4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [imageView, smallImageView].forEach { (imageView) in
            guard let imageView = imageView else { return }
            imageView.isUserInteractionEnabled = true
            imageView.addPointerInteraction(with: self)
        }
        
        let contextMenuInteraction = UIContextMenuInteraction(delegate: self)
        contextMenuButton.addInteraction(contextMenuInteraction)
        
        buttonStackView.arrangedSubviews.forEach { (view) in
            guard let button = view as? UIButton else { return }
            button.isPointerInteractionEnabled = true
        }
        setupButtonPointerInteraction()
    }
    
    private func setupButtonPointerInteraction() {
        contextMenuButton.pointerStyleProvider = { (button, _, _) in
            let targetedPreview = UITargetedPreview(view: button)
            return UIPointerStyle(effect: .automatic(targetedPreview))
        }
        
        shape1Button.pointerStyleProvider = { (button, _, _) in
            let pointerRect = CGRect(origin: .zero, size: CGSize(width: 25, height: 25))
            return UIPointerStyle(shape: .roundedRect(pointerRect, radius: UIPointerShape.defaultCornerRadius))
        }
        
        shape2Button.pointerStyleProvider = { (button, _, _) in
            let height = button.titleLabel?.font.lineHeight ?? button.frame.height
            return UIPointerStyle(shape: .verticalBeam(length: height))
        }
        
        shape3Button.pointerStyleProvider = { (button, _, _) in
            // Max width will be 100 points
            return UIPointerStyle(shape: .horizontalBeam(length: button.frame.width), constrainedAxes: .horizontal)
        }
        
        shape4Button.pointerStyleProvider = { (button, effect, shape) in
            // Offset is necessary so that the default pointer and this new pointer shape are algined correctly.
            let paperplanePath = UIBezierPath(svgPath: .paperplaneIcon, offset: 10.0)
            return UIPointerStyle(shape: .path(paperplanePath))
        }
    }
}

extension UIViewViewController: UIPointerInteractionDelegate {
    func pointerInteraction(_ interaction: UIPointerInteraction, styleFor region: UIPointerRegion) -> UIPointerStyle? {
        guard let view = interaction.view else { return nil }
        let targetedPreview = UITargetedPreview(view: view)
        return UIPointerStyle(effect: .lift(targetedPreview))
    }
}

extension UIView {
    func addPointerInteraction(with pointerInteractionDelegate: UIPointerInteractionDelegate) {
        let pointerInteraction = UIPointerInteraction(delegate: pointerInteractionDelegate)
        self.addInteraction(pointerInteraction)
    }
}
