//
//  ContentView.swift
//  SwiftUIListJumpToItem
//
//  Created by monkey on 2021/5/8.
//

import SwiftUI

struct ContentView: View {
    
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Jump to #8") {
                    value.scrollTo(8, anchor: .bottomLeading)
                }
                
                ForEach(0..<10) { i in
                    Text("Example \(i)")
                        .frame(width: 300, height: CGFloat.random(in: 150...300))
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
