//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

@available(iOS 16.0, *)
public struct MovieScene<Content: View>: View {
    public init(@ViewBuilder content: @escaping () -> Content) {
        //  length: Double, fps: Double
        self.content = content
//        self.length = length
//        self.fps = fps
    }
    public var content: () -> Content
//    public var length: Double
//    public var fps: Double
    @State var i = 0
    public var body: some View {
        ZStack(content: content)
            
    }
  
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0].appending(path: "TEST")
        return documentsDirectory
    }
}
