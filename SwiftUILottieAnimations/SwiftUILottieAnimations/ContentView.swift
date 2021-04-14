//
//  ContentView.swift
//  SwiftUILottieAnimations
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                LottieView(fileName: "figure-loading")
            }
            .navigationTitle("SwiftUI Lottie")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
