//
//  ContentView.swift
//  SwiftUIMap
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { reader in
                    MapView()
                        .frame(width: reader.size.width, height:  reader.size.height)
                }
            }
            .navigationTitle("SwiftUI Map")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
