//
//  SwiftUIDocumentShareApp.swift
//  SwiftUIDocumentShare
//
//  Created by monkey on 2021/5/8.
//

import SwiftUI

@main
struct SwiftUIDocumentShareApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: TextFile()) { file in
            ContentView(document: file.$document)
        }
    }
}
