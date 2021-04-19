//
//  ContentView.swift
//  SwiftUILinks
//
//  Created by monkey on 2021/4/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Form {
                Link("Open a link", destination: URL(string: "https://anchao-lu.github.io")!)
                Link(destination: URL(string: "https://anchao-lu.github.io")!, label: {
                    Label(
                        title: { Text("AnchaoLu Github") },
                        icon: { Image(systemName: "bookmark.circle") }
)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
