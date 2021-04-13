//
//  SwiftUIGaugeApp.swift
//  SwiftUIGauge WatchKit Extension
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

@main
struct SwiftUIGaugeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
