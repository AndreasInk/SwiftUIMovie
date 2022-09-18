//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct RecordModifer: ViewModifier {
    
    let fps: Double
    let length: Double
    var time = 0.0
    func body(content: Content) -> some View {
        content
           
            .onAppear {
                let _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(fps), repeats: true) { timer in
                    if length > time {
                        timer.invalidate()
                    } else {
                        recordView(content: content)
                    }
                }
            }
    }
    func recordView(content: Content) {
        do {
            let frame = content.snapshot()
            if let data = frame.pngData() {
                try data.write(to: getDocumentsDirectory().appending(path: Date().formatted(date: .omitted, time: .complete) + ".png"))
            } else {
                print("Movie.NoData.Error")
            }
        } catch {
            print("Movie.SaveFrame.Error")
        }
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
@available(iOS 16.0, *)
extension View {
    func record(length: Double, fps: Double) -> some View {
        modifier(RecordModifer(fps: fps, length: length))
    }
}
