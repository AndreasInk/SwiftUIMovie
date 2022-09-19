//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 9/17/22.
//

import SwiftUI

extension URL {
    static func getDocumentsDirectory() -> URL {
         let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0].appending(path: "TEST")
         return documentsDirectory
     }
}
