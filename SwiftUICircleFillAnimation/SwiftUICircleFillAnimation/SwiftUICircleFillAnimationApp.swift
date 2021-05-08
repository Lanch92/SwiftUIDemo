//
//  SwiftUICircleFillAnimationApp.swift
//  SwiftUICircleFillAnimation
//
//  Created by monkey on 2021/5/7.
//

import SwiftUI

@main
struct SwiftUICircleFillAnimationApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("didFinishLaunchingWithOptions")
        return true
    }
}
