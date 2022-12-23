//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

@available(macOS 10.15, *)
@available(iOS 16.0, *)
public class MovieBuilder: TimelapseBuilderDelegate, ObservableObject {
    
    
    public init() {
        
    }
    
    @Published public var frameRate = 30
    
    @Published public var videoTitle: String = "TEST"
    
    @Published public var completedProcessing: Bool = false
    
    @Published public var videoURL: URL?
    
    @Published public var movieData = Data()
    
    @AppStorage("length") var length = 150.0
    public func build() throws {
        DispatchQueue.main.async {
            
            self.completedProcessing = false
        }
        do {
            
            let imagePaths = try FileManager.default.contentsOfDirectory(atPath: URL.getMovieDir().path)
            let frames = imagePaths.filter{$0.contains("png")}.map{URL.getMovieDir().appending(path: $0).path}
            let sortedFrames = try frames.sorted { first, second in
                try  URL(filePath: first).resourceValues(forKeys: [.creationDateKey]).creationDate ?? Date() < URL(filePath: second).resourceValues(forKeys: [.creationDateKey]).creationDate ?? Date()
            }
            
            let builder = TimeLapseBuilder(delegate: self)
            builder.build(with: sortedFrames, atFrameRate: Int32(self.frameRate), type: .mp4, toOutputPath: URL.getMovieDir().appending(path: videoTitle + ".mp4").path)
        } catch {
            print(error)
        }
        
    }
    public func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didMakeProgress progress: Progress) {
        print(progress)
    }
    
    @MainActor
    public func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didFinishWithURL url: URL) {
        Task { @MainActor in
            do {
                
                movieData = try Data(contentsOf: URL.getMovieDir().appending(path: videoTitle + ".mp4"))
            } catch {
                print(error)
            }
            completedProcessing = true
            
        }
    }
        
    public func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didFailWithError error: Error) {
        print(error)
        
    }
    
}
