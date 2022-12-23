//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 12/22/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct MovieDocument: FileDocument {
    // tell the system we support only plain text
    static var readableContentTypes = [UTType.mpeg4Movie]

    // by default our document is empty
    var data = Data()

    // a simple initializer that creates new, empty documents
    init(initialData: Data = Data()) {
        data = initialData
    }

    // this initializer loads data that has been saved previously
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            self.data = data
        }
    }

    // this will be called when the system wants to write our data to disk
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: data)
    }
}
