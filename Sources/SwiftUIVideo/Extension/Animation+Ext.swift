//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

@available(iOS 13.0, *)
public extension Animation {
    static let breeze = Animation.interpolatingSpring(mass: 0.42,
                                                      stiffness: 5.85,
                                                      damping: 1.85,
                                                      initialVelocity: 4.2)
    static let ease = Animation.timingCurve(0.85, 0, 0.15, 1, duration: 1.3)
    static let slide = Animation.interpolatingSpring(mass: 0.21, stiffness: 2.8, damping: 1.28, initialVelocity: 3.0)
}
