//
//  ContentView.swift
//  SwiftUIColorPicker
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var backgroundColor = Color(.systemBackground)
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                
                ColorPicker("Select Color", selection: $backgroundColor)
                    .padding()
            }
            .navigationTitle(Text("Color Picker"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
