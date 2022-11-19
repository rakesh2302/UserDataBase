//
//  Label.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import UIKit

class Label: UILabel {

    // MARK: Functiions

     func animateTitleUp(duration: TimeInterval) {
        superview?.setNeedsLayout()
        superview?.layoutIfNeeded()
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
            let xTranslation = (self.bounds.width - (self.bounds.width * 0.8)) / 2.0
            let translation = CGAffineTransform(translationX: -xTranslation, y: -40.0)
            self.transform = scale.concatenating(translation)
        })
    }

    func animateTitleToStartingPosition(duration: TimeInterval) {
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform.identity
        })
    }
}
