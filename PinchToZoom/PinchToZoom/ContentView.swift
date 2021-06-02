//
//  ContentView.swift
//  PinchToZoom
//
//  Created by monkey on 2021/6/2.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentScale: CGFloat = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Magnify Me!")
                    .bold()
                    .font(.system(size: 32))
                    .padding()
                    .background(Color.pink)
                    .scaleEffect(currentScale)
                    .gesture(
                        MagnificationGesture()
                            .onChanged {scale in
                                currentScale = scale
                            }
                            .onEnded{ scale in
                                
                            }
                    )
            }
            .navigationTitle("Magnification Gesture")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
