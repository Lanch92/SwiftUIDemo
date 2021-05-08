//
//  ContentView.swift
//  SwiftUISlowListUpdate
//
//  Created by monkey on 2021/5/8.
//

import SwiftUI

struct ContentView: View {
    
    @State private var items = Array(1...600)
    
    var body: some View {
        VStack {
            Button("Shuffle") {
                items.shuffle()
            }
            
            List(items, id: \.self) {
                Text("Item \($0)")
            }
//            .id(UUID())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
