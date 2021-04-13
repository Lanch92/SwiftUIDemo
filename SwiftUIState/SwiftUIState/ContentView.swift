//
//  ContentView.swift
//  SwiftUIState
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isZoomed = false
    
    var body: some View {
        Image("Image")
            .resizable()
            .aspectRatio(contentMode: isZoomed ? .fit : .fill)
            .onTapGesture {
                withAnimation {
                    isZoomed.toggle()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
