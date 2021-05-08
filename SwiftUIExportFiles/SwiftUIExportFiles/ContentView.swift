//
//  ContentView.swift
//  SwiftUIExportFiles
//
//  Created by monkey on 2021/5/8.
//

import SwiftUI
import UniformTypeIdentifiers

struct TextFile: FileDocument {
    static var readableContentTypes = [UTType.bundle]
    
    init() {
        
    }
    
    init(configuration: ReadConfiguration) throws {
        
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper()
    }
}

struct ContentView: View {
    
    @State private var isPresentation = false
    
    // 使用 @ViewBuilder 修饰后，该计算属性才能成立
    @ViewBuilder var favorite: some View {
        if isPresentation {
            Text("Favorite")
                .background(Color.yellow)
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        VStack {
            Button("Export File") {
                isPresentation = true
            }
            favorite
        }
        .fileExporter(isPresented: $isPresentation, document: TextFile(), contentType: UTType.bundle) { result in
            switch result {
                
                case .success(let url):
                    print(url)
                case .failure(let err):
                    print(err)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
