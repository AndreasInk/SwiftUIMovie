//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

@available(iOS 16.0, *)
public struct Movie<Content: View>: View {
    @StateObject var screenRecorder = ScreenRecorder()
    public var content: () -> Content
    public init(length: Double, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.length = length
    }
    @State var length: Double
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var frameNumber = 0.0
    @StateObject var movie = MovieBuilder()
    public var body: some View {
        ZStack(content: content)
            .task {
                UserDefaults.standard.set(length, forKey: "length")
                if await screenRecorder.canRecord {
                    if let firstWindow = screenRecorder.filterWindows(screenRecorder.availableWindows).first {
                        screenRecorder.selectedWindow = firstWindow
                    }
                    await screenRecorder.start()
                } else {
                   
                }

            }
            .onReceive(timer) { timer in
                do {
                    print("FRAME")
                    print(frameNumber)
                    print("LENGTH")
                    print(length)
                    if frameNumber > length {
                        try movie.build()
                        self.timer = Timer.publish(every: 10000, on: .main, in: .common).autoconnect()
                    } else {
                        
                    }
                    frameNumber += 25
                } catch {
                    
                }
            }
    }
}
