//
//  ContentView.swift
//  SwiftUISideMenu
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var drawerOpened = false
    
    var body: some View {
        NavigationView {
            GeometryReader { reader in
                ZStack {
                    Button(action: {
                        self.drawerOpened.toggle()
                    }, label: {
                        Text("Open Drawer")
                            .frame(width: 200, height: 50)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    })
                    
                    SideMenuView(width: reader.size.width / 1.6, drawerOpend: drawerOpened, toggleDrawer: toggleDrawer)
                }
            }
        }
    }
    
    func toggleDrawer() {
        drawerOpened.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
