//
//  ContentView.swift
//  SwiftUIListExpand
//
//  Created by monkey on 2021/5/8.
//

import SwiftUI

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?
}

struct ContentView: View {
    
    let items: [Bookmark] = [
        Bookmark(name: "1", icon: "bookmark", items: [
            Bookmark(name: "11", icon: "bookmark", items: nil)
        ]),
        Bookmark(name: "2", icon: "bookmark", items: [
            Bookmark(name: "21", icon: "bookmark", items: nil),
            Bookmark(name: "22", icon: "bookmark", items: nil),
        ]),
        Bookmark(name: "3", icon: "bookmark", items: [
            Bookmark(name: "31", icon: "bookmark", items: [
                Bookmark(name: "311", icon: "bookmark", items: nil)
            ])
        ])
    ]
    
    var body: some View {
        List(items, children: \.items) { row in
            Image(systemName: row.icon)
            Text(row.name)
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
