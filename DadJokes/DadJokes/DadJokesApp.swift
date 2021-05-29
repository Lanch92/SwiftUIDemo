//
//  DadJokesApp.swift
//  DadJokes
//
//  Created by monkey on 2021/5/28.
//

import SwiftUI

@main
struct DadJokesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
