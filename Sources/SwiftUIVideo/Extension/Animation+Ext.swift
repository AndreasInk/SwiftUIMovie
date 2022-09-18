//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

@available(iOS 13.0, *)
extension Animation {
    static let breeze = Animation.interpolatingSpring(mass: 0.42,
                                                      stiffness: 5.85,
                                                      damping: 1.85,
                                                      initialVelocity: 4.2)
}
