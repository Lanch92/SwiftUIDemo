//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by monkey on 2021/4/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Screen(title: "Home", imageName: "house", screenName: "First Screen")
        }
    }
}

struct Screen: View {
    
    let title: String
    let imageName: String
    let screenName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            Text(screenName)
                .font(.system(size: 30, weight: .light, design: .default))
                .padding()
            
            NavigationLink(
                destination:
                    Screen(title: "Notifications", imageName: "bell", screenName: "Second Screen"),
                label: {
                    ContinueButton(color: .pink)
                })
        }
        .navigationTitle(title)
    }
}

struct ContinueButton: View {
    
    let color: Color
    
    var body: some View {
        Text("Continue")
            .frame(width: 200, height: 50)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
