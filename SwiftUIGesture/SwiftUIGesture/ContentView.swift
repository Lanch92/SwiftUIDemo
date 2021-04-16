//
//  ContentView.swift
//  SwiftUIGesture
//
//  Created by monkey on 2021/4/16.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var isLongPress = false
    @State private var offset: CGSize = .zero
    
    var body: some View {
        
        let longPress = LongPressGesture()
            .updating($isLongPress) { (newValue, state, transaction) in
                state = newValue
            }
        
        let dragGesture = DragGesture()
            .onChanged { (value: DragGesture.Value) in
                
                offset = value.translation
            }
        
        VStack {
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(isLongPress ? .orange : .blue)
                .scaleEffect(isLongPress ? 2 : 1.0)
                .gesture(longPress)
                .animation(.spring())
            
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(.pink)
                .offset(x: offset.width, y: offset.height)
                .gesture(dragGesture)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
