//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//
//
//import SwiftUI
//
//@available(iOS 16.0, *)
//public struct RecordModifer: ViewModifier {
//
//    public let fps: Double
//    public let length: Double
//    @State var time = 0.0
//    @State var image = UIImage()
//    public func body(content: Content) -> some View {
//        VStack {
//
//            content
//
//                .onAppear {
//
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self]
//
//
//                    }
//                }
//        }
//    }
//    public func recordView(content: Content) {
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            do {
//                let frame = content.snapshot()
//                if let data = frame.pngData() {
//                    try data.write(to: getDocumentsDirectory().appendingPathComponent( "\(Int(time))" + ".png"))
//                } else {
//                    print("Movie.NoData.Error")
//                }
//            } catch {
//                print("Movie.SaveFrame.Error")
//            }
//        }
//    }
//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
//        let documentsDirectory = paths[0]
//        return documentsDirectory
//    }
//    func clearCache() {
//        if let cacheURL =  FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first {
//            let fileManager = FileManager.default
//            do {
//                // Get the directory contents urls (including subfolders urls)
//                let directoryContents = try FileManager.default.contentsOfDirectory( at: cacheURL, includingPropertiesForKeys: nil, options: [])
//                for file in directoryContents {
//                    do {
//                        try fileManager.removeItem(at: file)
//                    }
//                    catch let error as NSError {
//                        debugPrint("Ooops! Something went wrong: \(error)")
//                    }
//
//                }
//            } catch let error as NSError {
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
//@available(iOS 16.0, *)
//public extension View {
//    func record(length: Double, fps: Double) -> some View {
//        modifier(RecordModifer(fps: fps, length: length))
//    }
//}
