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
        UserDefaults.standard.set(length, forKey: "length")
    }
    @State var length: Double
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var frameNumber = 0.0
    @StateObject var movie = MovieBuilder()
    public var body: some View {
        
        ZStack(content: content)
            .aspectRatio(16/9, contentMode: .fit)
            .padding(.top, 25)
            .fileExporter(isPresented: $movie.completedProcessing, document: MovieDocument(initialData: movie.movieData), contentType: .mpeg4Movie) { result in
                switch result {
                case .success(let url):
                    print("Saved to \(url)")
                   // URL.clearMovieDir()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .task(priority: .background) {
                URL.clearMovieDir()
                print(length)
                if await screenRecorder.canRecord {
                    await screenRecorder.monitorAvailableContent()
                    if let firstWindow = screenRecorder.filterWindows(screenRecorder.availableWindows).first {
                        screenRecorder.selectedWindow = firstWindow
                    }  else {
                        print("WINDOW NOT FOUND")
                    }
                    await screenRecorder.start()
                }
                
            }
            .onReceive(timer) { timer in
                do {
                    if frameNumber > length {
                        DispatchQueue.global().async {
                            do {
                                try movie.build()
                            } catch {
                                
                            }
                        }
                        Task {
                            await screenRecorder.stop()
                        }
                        self.timer.upstream.connect().cancel()
                    } else {
                        
                    }
                    print(frameNumber)
                    frameNumber += 1
                } catch {
                    print(error)
                }
            }
    }
}
