//
//  ContentView.swift
//  SwiftUISecrets
//
//  Created by monkey on 2021/4/17.
//

import SwiftUI
import SwiftUIX

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinkPresentationView(url: URL(string: "https://www.apple.com")!)
                    .frame(height: 192)
                
                ActivityIndicator()
                    .animated(true)
                    .style(.large)
                
//                VisualEffectBlurView(blurStyle: .dark)
//                    .edgesIgnoringSafeArea(.all)
                BlurEffectView(style: .dark) {
                    Text("Hello World!")
                }
                    .ignoresSafeArea()
            }
            .navigationTitle("SwiftUIX")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
