//
//  ContentView.swift
//  SwiftUIGeoReader
//
//  Created by monkey on 2021/4/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0...20, id: \.self) { num in
                        GeometryReader { proxy in
                            let frame = proxy.frame(in: .global)
                            let x = frame.origin.x
                            
                            Text("\(Int(x))")
                                .bold()
                                .font(.system(size: 24))
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.blue)
                        .padding()
                    }
                }
            }
            .background(Color.pink)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
