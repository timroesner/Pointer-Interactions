//
//  UIViewViewController+ContextMenu.swift
//  PointerInteraction
//
//  Created by Tim Roesner on 4/12/20.
//  Copyright © 2020 Tim Roesner. All rights reserved.
//

import UIKit

extension UIViewViewController: UIContextMenuInteractionDelegate {
    func makeContextMenu() -> UIMenu {
        let starAction = UIAction(title: "Star", image: UIImage(systemName: "star")) { action in
            // Perform star
        }
        
        let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
            // Perform share
        }
        
        let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
            // Perform delete
        }
        
        return UIMenu(title: "", children: [starAction, shareAction, deleteAction])
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
                                previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let view = interaction.view else { return nil }
        return UITargetedPreview(view: view)
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            return self.makeContextMenu()
        }
    }

    func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
                                willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration,
                                animator: UIContextMenuInteractionCommitAnimating) {
        // No op
    }
}
