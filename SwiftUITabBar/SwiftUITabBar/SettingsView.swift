//
//  SettingsView.swift
//  SwiftUITabBar
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            
            List(0..<100) { _ in
                Text("Settings")
                    .opacity(0.8)
            }
            .navigationTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear() {
            print("Settings appear")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
