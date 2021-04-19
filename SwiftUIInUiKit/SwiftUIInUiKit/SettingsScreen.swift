//
//  SettingsScreen.swift
//  SwiftUIInUiKit
//
//  Created by monkey on 2021/4/16.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State private var isSubscriber = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Toggle(isOn: $isSubscriber, label: {
                        Text("Is Subscribed")
                    })
                    Toggle(isOn: $isSubscriber, label: {
                        Text("Is Subscribed")
                    })
                    Toggle(isOn: $isSubscriber, label: {
                        Text("Is Subscribed")
                    })
                }
                Spacer()
            }
            .navigationTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
