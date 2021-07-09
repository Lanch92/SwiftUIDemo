//
//  KeyboardCustomButton.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct KeyboardCustomButton: View {
    
    @State private var name = "Dean-o"
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        TextField("Enter your name", text: $name)
            .textFieldStyle(.roundedBorder)
            .focused($isInputActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Click me!") {
                        print("Clicked")
                        isInputActive = false
                    }
                }
            }
    }
}

struct KeyboardCustomButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardCustomButton()
    }
}
