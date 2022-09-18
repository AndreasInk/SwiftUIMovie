//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

@available(iOS 16.0, *)
public struct Movie<Content: View>: View {
    public var content: () -> Content
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    public var body: some View {
        ZStack(content: content)
          
    }
}
