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

    @Published public var videoURL: URL?
    
    @AppStorage("length") var length = 150.0
    public func build(videoTitle: String = "test") throws {
        //let movie = Color.green.frame(width: 2000, height: 2000, alignment: .center)
        
      
            do {
               
                let imagePaths = try FileManager.default.contentsOfDirectory(atPath: self.getDocumentsDirectory().path)
                self.videoURL =  self.getDocumentsDirectory()
                let frames = imagePaths.filter{$0.contains("png")}.map{self.getDocumentsDirectory().appending(path: $0).path}
                let sortedFrames = try frames.sorted { first, second in
                  try  URL(filePath: first).resourceValues(forKeys: [.creationDateKey]).creationDate ?? Date() < URL(filePath: second).resourceValues(forKeys: [.creationDateKey]).creationDate ?? Date()
                }
                let builder = TimeLapseBuilder(delegate: self)
                builder.build(with: sortedFrames, atFrameRate: Int32(self.frameRate), type: .mp4, toOutputPath: self.getDocumentsDirectory().appending(path: videoTitle + ".mp4").path)
            } catch {
            }
            
    }
    public func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didMakeProgress progress: Progress) {
        print(progress)
    }
    
    @MainActor
    public func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didFinishWithURL url: URL) {
        DispatchQueue.main.async {
           // self.videoURL = url
        }
        
        
        }
    
    public func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didFailWithError error: Error) {
        print(error)
       
    }
   public func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0].appending(path: "TEST")
        return documentsDirectory
    }
  
    
}
