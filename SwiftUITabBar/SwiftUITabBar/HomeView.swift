//
//  HomeView.swift
//  SwiftUITabBar
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                
                List(0..<100) { _ in
                    Text("Home")
                        .foregroundColor(.white)
                }
            }
            .navigationTitle("Home")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear() {
            print("Home appear")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
