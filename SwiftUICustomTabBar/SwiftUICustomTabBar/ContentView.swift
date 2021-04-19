//
//  ContentView.swift
//  SwiftUICustomTabBar
//
//  Created by monkey on 2021/4/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndex = 0
    @State private var presented = false
    
    let icons = [
        "house",
        "gear",
        "plus",
        "lasso",
        "message"
    ]
    
    var body: some View {
        VStack {
            // Content
            ZStack {
                
                Spacer().fullScreenCover(isPresented: $presented, content: {
                    Button(action: {
                        presented = false
                    }, label: {
                        Text("Close")
                            .frame(width: 200, height: 50)
                            .background(Color.pink)
                        foregroundColor(.white)
                            .cornerRadius(12)
                    })
                })
                switch selectedIndex {
                case 0:
                    NavigationView {
                        VStack {
                            Text("Home Screen")
                        }
                        .navigationTitle("Home")
                    }
                case 1:
                    NavigationView {
                        VStack {
                            Text("Settings Screen")
                        }
                        .navigationTitle("Settings")
                    }
                case 2:
                    NavigationView {
                        VStack {
                            Text("Add Screen")
                        }
                        .navigationTitle("Add")
                    }
                case 3:
                    NavigationView {
                        VStack {
                            Text("Edit Screen")
                        }
                        .navigationTitle("Edit")
                    }
                default:
                    NavigationView {
                        VStack {
                            Text("Message Screen")
                        }
                        .navigationTitle("Message")
                    }
                }
            }
            
            Spacer()
            // Custom Tab Bar
            Divider()
            HStack {
                ForEach(0..<5, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        if number == 2 {
                            presented.toggle()
                        } else {
                            
                            selectedIndex = number
                        }
                    }, label: {
                        if number == 2 {
                            Image(systemName: icons[number])
                                .font(.system(size: 25, weight: Font.Weight.regular, design: Font.Design.default))
                                .foregroundColor(.white).frame(width: 60, height: 60)
                                .background(Color.blue)
                                .cornerRadius(30)
                                .offset(x: 0, y: -15.0)
                                
                        } else {
                            Image(systemName: icons[number])
                                .font(.system(size: 25, weight: Font.Weight.regular, design: Font.Design.default))
                                .foregroundColor(selectedIndex == number ? Color(.label) : Color(.lightGray))
                        }
                    })
                    Spacer()
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
