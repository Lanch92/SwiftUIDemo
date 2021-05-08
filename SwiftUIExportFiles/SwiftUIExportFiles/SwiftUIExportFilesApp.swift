//
//  SwiftUIExportFilesApp.swift
//  SwiftUIExportFiles
//
//  Created by monkey on 2021/5/8.
//

import SwiftUI
import CoreSpotlight

@main
struct SwiftUIExportFilesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onContinueUserActivity(CSSearchableItemActionType, perform: handleSpotlight)
        }
    }
    
    func handleSpotlight(_ userActivity: NSUserActivity) {
        if let id = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            print("Found identifier \(id)")
        }
    }
}
