//
//  ContentView.swift
//  SwiftUIAccessibility
//
//  Created by monkey on 2021/5/7.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("1")
                        .padding()
                    Text("2")
                        .padding()
                    Text("3")
                        .padding()
                    Text("4")
                        .padding()
                }
                .accessibilityElement()
                .accessibility(label: Text("Numbers Row"))
                .accessibilityHint(Text("1"))
                .accessibilityValue(Text("\(selectedNumber)"))
                .accessibilityAdjustableAction { direction in
                    switch direction {
                        case .increment:
                            self.selectedNumber += 1
                        case .decrement:
                            guard self.selectedNumber > 1 else { return }
                            self.selectedNumber -= 1
                        @unknown default:
                            break
                    }
                }
            }
            .navigationTitle("SwiftUI Accessibility")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
