//
//  CALayer+Extension.swift
//  CALayer+Extension
//
//  Created by Igor Naumenko on 25.07.2021.
//

import QuartzCore
import UIKit

extension CALayer {
    func addShadow(radius: CGFloat, rect: CGRect) {
        masksToBounds = false
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 0.2
        shadowOffset = .zero
        shadowRadius = radius
        shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
    }
}
