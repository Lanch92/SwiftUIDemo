//
//  ContentView.swift
//  SwiftUITabBar
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
