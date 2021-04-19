//
//  ContentView.swift
//  SwiftUIScrollViewReader
//
//  Created by monkey on 2021/4/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        Button(action: {
                            withAnimation {
                                
                                scrollView.scrollTo(999, anchor: .center)
                            }
                        }, label: {
                            Text("Scroll To Bottom")
                                .padding()
                        })
                        
                        ForEach(0..<1000, id: \.self) { num in
                            HStack {
                                Label(
                                    title: { Text("Position: \(num)") },
                                    icon: { Image(systemName: "house") }
                                )
                                Spacer()
                            }
                            .id(num)
                            .padding()
                        }
                    }
                }
                .navigationTitle("Scroll View")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
