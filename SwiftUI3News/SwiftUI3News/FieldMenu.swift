//
//  FieldMenu.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct FieldMenu: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Section {
                Form {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                .onSubmit {
                    guard username.isEmpty == false && password.isEmpty == false else { return }
                    print("Authenticating...")
                }
            }
            
            Section {
                Menu("Options") {
                    Button("Order Now", action: {})
                    Button("Adjust Order", action: {})
                    Button("Cancel", action: {})
                } primaryAction: {
                    print("Button tapped")
                }
            }
        }
    }
}

struct FieldMenu_Previews: PreviewProvider {
    static var previews: some View {
        FieldMenu()
    }
}
