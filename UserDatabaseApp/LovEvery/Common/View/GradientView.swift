//
//  GradientView.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import UIKit

class GradientView: UIView {

    // MARK: Function

    func addBackground() {
        let gradient: CAGradientLayer = CAGradientLayer()
        let color = UIColor(red: (101/255),
                            green: (201/255),
                            blue: (203/255),
                            alpha: 1.0)

        gradient.colors = [UIColor.blue.cgColor, color.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)

        layer.insertSublayer(gradient, at: 0)
    }
}

extension GradientView {

    // MARK: Default Function

    override func draw(_ rect: CGRect) {
        addBackground()
    }
}
