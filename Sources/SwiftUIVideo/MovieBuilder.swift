//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

@available(iOS 16.0, *)
public class MovieBuilder: TimelapseBuilderDelegate, ObservableObject {
    
    
    public init() {}
    @Published public var assetPaths = [String]()
    @Published public var frameRate = 24.0

    @Published public var videoURL: URL?
    public func build(videoTitle: String = "") {
        let builder = TimeLapseBuilder(delegate: self)
        builder.build(with: assetPaths, atFrameRate: Int32(frameRate), type: .mp4, toOutputPath: getDocumentsDirectory().appending(path: videoTitle + ".mp4").path)
    }
    public func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didMakeProgress progress: Progress) {
        
    }
    
    public func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didFinishWithURL url: URL) {
        videoURL = url
        
    }
    
    public func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didFailWithError error: Error) {
        
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
}
