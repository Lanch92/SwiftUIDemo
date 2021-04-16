//
//  ContentView.swift
//  SwiftUIAppStorage
//
//  Created by monkey on 2021/4/16.
//

import SwiftUI

struct Settings {
    static let firstNameKey = "firstName"
    static let lastNameKey = "lastName"
    static let isSubscriberKey = "isSubscriber"
}

struct ContentView: View {
    
    // 会在所绑定的 UI 的属性的值变化时自动存储
    // 比如：输入框的 text
    @AppStorage(Settings.firstNameKey) var firstName = ""
    @AppStorage(Settings.lastNameKey) var lastName = ""
    @AppStorage(Settings.isSubscriberKey) var isSubscriber = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Details")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                    }
                    
                    Section(header: Text("Member Status")) {
                        Toggle("Is Subscribed", isOn: $isSubscriber)
                    }
                }
            }
            .navigationTitle("AppStorage")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
