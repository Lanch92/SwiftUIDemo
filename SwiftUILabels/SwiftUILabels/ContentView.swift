//
//  ContentView.swift
//  SwiftUILabels
//
//  Created by monkey on 2021/4/16.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    let title: String
    let systemImageName: String
}

struct ContentView: View {
    
    let menuItems = [
        MenuItem(title: "Home", systemImageName: "house"),
        MenuItem(title: "Profile", systemImageName: "person.circle"),
        MenuItem(title: "Activity", systemImageName: "bell"),
        MenuItem(title: "Settings", systemImageName: "gear"),
        MenuItem(title: "Airplane", systemImageName: "airplane"),
        MenuItem(title: "Rate App", systemImageName: "star")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(menuItems) { item in
                Label(
                    title: { Text(item.title) },
                    icon: { Image(systemName: item.systemImageName) }
                )
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(Color(.systemBlue))
                .padding()
                .onTapGesture {
                    print("Tapped")
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
