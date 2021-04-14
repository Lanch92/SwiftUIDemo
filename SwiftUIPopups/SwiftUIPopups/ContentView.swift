//
//  ContentView.swift
//  SwiftUIPopups
//
//  Created by monkey on 2021/4/14.
//

import PopupView
import SwiftUI

struct ContentView: View {
    
    @State private var showingPopup = false
    
    var body: some View {
        ZStack {
            Button(action: {
                showingPopup = true
            }, label: {
                Text("Show popup")
            })
        }
        .popup(isPresented: $showingPopup, type: .floater(verticalPadding: 30), autohideIn: 2) {
            HStack {
                Text("The popup")
            }
            .frame(width: 200, height: 60)
            .background(Color(red: 0.85, green: 0.8, blue: 0.95))
            .cornerRadius(30.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
