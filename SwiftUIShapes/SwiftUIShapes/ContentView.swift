//
//  ContentView.swift
//  SwiftUIShapes
//
//  Created by monkey on 2021/6/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Button(action: {}, label: {
                    Text("Delete Account")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.red)
                        .background(Color.black)
                        .clipShape(Capsule())
                })
                    
                Circle()
                    .fill(Color.blue)
                    .frame(width: 150, height: 150)
                
                Rectangle()
                    .frame(width: 200, height: 150)
                    .foregroundColor(.red)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 200, height: 150)
                    .foregroundColor(.orange)
                    
                Capsule()
                    .frame(width: 200, height: 50)
                    .foregroundColor(.pink)
                
                Ellipse()
                    .frame(width: 100, height: 50)
                    .foregroundColor(.yellow)
                
                Triangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                
                Semicircle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.purple)
                
            }
            .navigationTitle("Shapes")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // lines of path
        // 1. start at top middle
        path.move(to: CGPoint(x: rect.width / 2, y: 0))
        // 2. line to bottom left
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        // 3. line to bottom right
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        // end at top middle
        path.addLine(to: CGPoint(x: rect.width / 2, y: 0))
        
        return path
    }
}

struct Semicircle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // clockwise: false : 下半圆
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: false)
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
