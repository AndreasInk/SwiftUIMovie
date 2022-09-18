//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI
//import UIKit
//
//@available(iOS 16.0, *)
//public extension View {
//    func snapshot() -> UIImage {
//        let controller = UIHostingController(rootView: self)
//        let view = controller.view
//
//        let targetSize = controller.view.intrinsicContentSize
//        view?.bounds = CGRect(origin: .zero, size: targetSize)
//        view?.backgroundColor = .clear
//
//        let renderer = UIGraphicsImageRenderer(size: targetSize)
//
//        return renderer.image { _ in
//            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
//        }
//    }
//}
//
//@available(iOS 16.0, *)
//public extension View {
//    
//    func recordView(_ length: Double, _ fps: Double) {
//        var time = 0.0
//
//        let _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(fps), repeats: true) { timer in
//            Task {
//                if length < time {
//                    timer.invalidate()
//                } else {
//                    await recordView(content: self, time: time)
//                }
//                time += fps
//            }
//        }
//    }
//    @available(iOS 16.0, *)
//    func recordView(content: some View, time: Double) async {
//       
//
//            do {
//                
//                let frame = await ImageRenderer(content: content)
//                print(await frame.uiImage?.pngData())
//                if let data = await frame.uiImage?.pngData() {
//                    try data.write(to: .getDocumentsDirectory().appendingPathComponent( "\(Int(time))" + ".png"))
//                } else {
//                    print("Movie.NoData.Error")
//                }
//            } catch {
//                print("Movie.SaveFrame.Error")
//            }
//
//    }
//}
extension URL {
    static func getDocumentsDirectory() -> URL {
         let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0].appending(path: "TEST")
         return documentsDirectory
     }
}
