//
//  ContentView.swift
//  SwiftUINavigationLink
//
//  Created by monkey on 2021/5/8.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive = false
    @State private var selection: String?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                NavigationLink(
                    destination: Text("Push directly"),
                    label: {
                        Text("Push Directly")
                    })
                
                
                NavigationLink(
                    destination: Text("Push by isActive")
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: Button(action: {
                            isActive = false
                        }, label: {
                            Text("Back")
                        })), isActive: $isActive,
                    label: {
                        Button(action: {
                            // more code here
                            print("push")
                            isActive = true
                            //                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            //                                self.isActive = false
                            //                            }
                        }, label: {
                            Text("Push by isActive")
                        })
                    })
                
                NavigationLink(
                    destination: Text("Push by tag: Second"), tag: "Second", selection: $selection,
                    label: {
                        Button(action: {
                            // more code here
                            print("push")
                            selection = "Second"
                            
                        }, label: {
                            Text("Push by tag")
                        })
                    })
                
                NavigationLink(
                    destination: Text("Push by tag: Third"), tag: "Third", selection: $selection,
                    label: {
                        Button(action: {
                            // more code here
                            print("push")
                            selection = "Third"
                        }, label: {
                            Text("Push by tag")
                        })
                    })
            }
            .navigationTitle("NavigationLink")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
