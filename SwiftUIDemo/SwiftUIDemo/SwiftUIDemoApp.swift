//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by monkey on 2020/12/19.
//

import SwiftUI
import Combine

@main
struct SwiftUIDemoApp: App {
    
    @StateObject private var modelData = ModelData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        
        let mySub = MySubscriber()
        
        let mainWindow = WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }.onChange(of: scenePhase) { newScenePhase in
            
            switch newScenePhase {
                case .active:
                    print ("Subscribing at \(Date())")
                    timerPub.collect(2).sink(receiveValue: {
                        print($0)
                    })
                    print("激活")
                case .background:
                    print("后台")
                case .inactive:
                    print("非活跃状态")
                @unknown default:
                    print("未知状态")
            }
        }
        
        #if os(macOS)
        return mainWindow.commands {
            LandmarkCommands()
        }
        #else
        return mainWindow
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}

let timerPub = Timer.publish(every: 1, on: .main, in: .default)
    .autoconnect()

class MySubscriber: Subscriber {
    typealias Input = Date
    typealias Failure = Never
    var subscription: Subscription?
    
    var _initDemand = 3
    var _space = 2
    var _maxDemand = 10
    var _currentDemand = 0
    
    func receive(subscription: Subscription) {
        print("published                             received")
        self.subscription = subscription
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.subscription?.request(.max(self._initDemand))
        }
    }
    
    func receive(_ input: Date) -> Subscribers.Demand {
        print("\(input)             \(Date())")
        _currentDemand += 1
        if _currentDemand >= _maxDemand {
            return Subscribers.Demand.none
        } else {
            return .max(_initDemand + _space)
        }
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print ("--done--")
    }
}
