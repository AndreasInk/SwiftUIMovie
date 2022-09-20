//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//
//

import SwiftUI

public struct ShowModifier: ViewModifier {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    public let frame: Double
    public let frame2: Double = .infinity
    @State var time = 0.0
    public func body(content: Content) -> some View {
        Group {
            if frame <= time && time <= frame2 {
                content
                    .transition(.opacity)
            }
        }
            .onReceive(timer) { timer in
                withAnimation(.ease) {
                    time += 25
                }
                if time <= frame2 {
                    self.timer.upstream.connect().cancel()
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
