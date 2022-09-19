//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//
//

import SwiftUI

public struct ShowModifier: ViewModifier {
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    public let frame: Double
    @State var time = 0.0
    public func body(content: Content) -> some View {
       content
            .opacity(frame <= time ? 1 : 0)
            .onReceive(timer) { timer in
                withAnimation(.ease) {
                    time += 25
                }
            }
    }
}
@available(iOS 16.0, *)
public extension View {
    func show(at frame: Double) -> some View {
        modifier(ShowModifier(frame: frame))
    }
}
