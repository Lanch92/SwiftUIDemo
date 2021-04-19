//
//  ContentView.swift
//  SwiftUIDisclosureGroup
//
//  Created by monkey on 2021/4/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isExpanded = false
    @State private var isPrivacyExpanded = false
    @State private var isTermsExpanded = false
    
    var body: some View {
        NavigationView {
            VStack {
                DisclosureGroup("Legal Stuff", isExpanded: $isExpanded) {
                    DisclosureGroup("Privacy Policy", isExpanded: $isPrivacyExpanded) {
                        Text("These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms.")
                    }
                    .padding()
                    
                    DisclosureGroup("Privacy Policy", isExpanded: $isTermsExpanded) {
                        Text("These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms. These are our terms.")
                    }
                    .padding()
                }
                
                Spacer()
            }
            .navigationTitle("Disclosure Group")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
