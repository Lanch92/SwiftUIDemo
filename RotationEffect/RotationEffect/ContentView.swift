//
//  ContentView.swift
//  RotationEffect
//
//  Created by monkey on 2021/6/2.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentAngle: Angle = .degrees(0)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .bold()
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .rotationEffect(currentAngle)
                    .gesture(
                        RotationGesture()
                            .onChanged{ angle in
                                currentAngle = angle
                            }
                    )
            }
            .navigationTitle("Rotation Effect")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
