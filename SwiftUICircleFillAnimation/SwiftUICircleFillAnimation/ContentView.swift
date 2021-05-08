//
//  ContentView.swift
//  SwiftUICircleFillAnimation
//
//  Created by monkey on 2021/5/7.
//

import SwiftUI

struct ContentView: View {
    
    @State var value: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 11 / 255.0, green: 15 / 255.0, blue: 128 / 255.0, alpha: 1))
            
            ZStack {
                
                // Track circle
                Circle()
                    .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                
                // Animation circle
                Circle()
                    .trim(from: 0.0, to: value)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -90))
                    .animation(.linear(duration: 0.3))
                
                Text("$\(Int(value * 100))")
                    .foregroundColor(.white)
                    .font(.system(size: 52))
            }
            .padding(50)
        }
        .onTapGesture {
            value = 0
            
            let max = Int.random(in: 0...100)
            for x in 0...max {
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(x / 10)) {
                    
                    value += 0.01
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
