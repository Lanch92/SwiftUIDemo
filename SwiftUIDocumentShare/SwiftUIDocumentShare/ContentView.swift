//
//  ContentView.swift
//  SwiftUIDocumentShare
//
//  Created by monkey on 2021/5/8.
//

import SwiftUI
import UniformTypeIdentifiers

struct TextFile: FileDocument {
    
    static var readableContentTypes = [UTType.plainText]
    
    var text = ""
    
    init(initialText: String = "") {
        text = initialText
    }
    
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        
        let fileWrapper = FileWrapper(regularFileWithContents: data)
        return fileWrapper
    }
}

struct ContentView: View {
    
    @Binding var document: TextFile
    
    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(TextFile()))
    }
}
