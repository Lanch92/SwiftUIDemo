//
//  ContentView.swift
//  SwiftUIWebView
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Web(url: URL(string: "https://www.apple.com/"))
                .navigationTitle("WebView")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
