//
//  ContentView.swift
//  SwiftUIToolBar
//
//  Created by monkey on 2021/6/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("SwiftUI Toolbar")
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button(action: {
                        
                    }, label: {
                        Text("First")
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Second")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Text("Bottom Button")
                    })
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
