//
//  ButtonRole.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct ButtonRole: View {
    @State private var showingAlert = false
    @State private var showingOptions = false
    @State private var selected = "None"
    
    var body: some View {
        VStack {
            
            Button("Show Alert") {
                showingAlert = true
            }
            
            Text(selected)
            
            Button("Confirm paint color") {
                showingOptions = true
            }
        }
        .alert("Important message!", isPresented: $showingAlert) {
            Button("First", role: .destructive) {}
            // 无效
            HStack {
                Button("Second") {}
                Button("Third") {}
            }
        }
        .confirmationDialog("Select a color", isPresented: $showingOptions, titleVisibility: .visible) {
            Button("Red", role: .destructive) {
                selected = "Red"
            }
            Button("Green") {
                selected = "Green"
            }
            Button("Blue") {
                selected = "Blue"
            }
        }
    }
}

struct ButtonRole_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRole()
    }
}
