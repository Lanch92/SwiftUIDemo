//
//  SideBar.swift
//  SwiftUIOnboardingUI
//
//  Created by monkey on 2021/5/7.
//

import SwiftUI

struct SideBar: View {
    var body: some View {
        List(0...100, id: \.self) { i in
            Text("Row \(i)")
        }
        .listStyle(SidebarListStyle())
    }
}

struct PrimaryView: View {
    var body: some View {
        Text("PrimaryView")
    }
}

struct DetailView: View {
    var body: some View {
        Text("DetailView")
    }
}

struct SideBarView: View {
    var body: some View {
        NavigationView {
            SideBar()
            PrimaryView()
            DetailView()
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
