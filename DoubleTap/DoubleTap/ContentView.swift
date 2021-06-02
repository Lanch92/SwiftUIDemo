//
//  ContentView.swift
//  DoubleTap
//
//  Created by monkey on 2021/6/2.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showLike = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .onTapGesture(count: 2) {
                        showLike.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showLike.toggle()
                        }
                    }
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .opacity(showLike ? 1 : 0)
                    .animation(.linear(duration: 1))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
