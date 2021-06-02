//
//  ContentView.swift
//  SwiftUIAppUnsells
//
//  Created by monkey on 2021/6/2.
//

import StoreKit
import SwiftUI

struct ContentView: View {
    
    @State private var showStore = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Button(action: {
                    showStore.toggle()
                }, label: {
                    Text("Download Now")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.red)
                        .background(Color.black)
                        .clipShape(Capsule())
                })
            }
            .appStoreOverlay(isPresented: $showStore, configuration: {
                SKOverlay.AppConfiguration(appIdentifier: "1505064531", position: .bottomRaised)
            })
            .navigationTitle("Unsell App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
