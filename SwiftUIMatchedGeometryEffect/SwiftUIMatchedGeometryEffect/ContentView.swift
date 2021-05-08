//
//  ContentView.swift
//  SwiftUIMatchedGeometryEffect
//
//  Created by monkey on 2021/5/8.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isFlipped = false
    @Namespace private var animation
    
    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(Color.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Circle", in: animation)
                
                Text("Taylor Swift - 1989")
                    .font(.headline)
                    .matchedGeometryEffect(id: "Text", in: animation)
            } else {
                
                Text("Taylor Swift - 1989")
                .font(.headline)
                    .matchedGeometryEffect(id: "Text", in: animation)
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 88, height: 88)
                    .matchedGeometryEffect(id: "Circle", in: animation)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
