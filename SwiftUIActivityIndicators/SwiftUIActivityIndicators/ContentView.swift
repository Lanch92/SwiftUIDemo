//
//  ContentView.swift
//  SwiftUIActivityIndicators
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI
import ActivityIndicatorView

struct ContentView: View {
    
    @State private var loading = true
    
    var body: some View {
        ActivityIndicatorView(isVisible: $loading, type: .equalizer)
            .frame(width: 100, height: 100)
            .foregroundColor(.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
