//
//  SwiftUIToDoListApp.swift
//  SwiftUIToDoList
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

@main
struct SwiftUIToDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
