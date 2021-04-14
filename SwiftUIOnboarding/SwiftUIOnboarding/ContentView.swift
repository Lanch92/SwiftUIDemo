//
//  ContentView.swift
//  SwiftUIOnboarding
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI
import ConcentricOnboarding

struct ContentView: View {
    var body: some View {
        ConcentricOnboardingView(
            pages: [
                AnyView(Text("Hello World!")),
                AnyView(Text("Hello World!")),
                AnyView(Text("Hello World!"))],
            bgColors: [.pink, .blue, .purple],
            duration: 2.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
