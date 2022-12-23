//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

extension URL {
    static let sessionID = UUID().uuidString
    static func getMovieDir() -> URL {
        let paths = FileManager.default.temporaryDirectory.appending(path: URL.sessionID)
           let swiftUIMovieDir = paths
        do {
            try FileManager.default.createDirectory(at: swiftUIMovieDir, withIntermediateDirectories: false)
        } catch {
            
        }
           return swiftUIMovieDir
       }
    static func clearMovieDir() {
        do {
            let paths = FileManager.default.temporaryDirectory.appending(path: "TEST")
            let swiftUIMovieDir = paths
            if try !swiftUIMovieDir.checkResourceIsReachable() {
                try FileManager.default.removeItem(at: swiftUIMovieDir)
            }
        } catch {
            print("ERROR: Please give the project write access")
        }
     }
}
