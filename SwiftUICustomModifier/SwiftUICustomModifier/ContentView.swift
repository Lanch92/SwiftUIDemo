//
//  ContentView.swift
//  SwiftUICustomModifier
//
//  Created by monkey on 2021/4/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    // 直接通过 .modifier 来使用
                    //.modifier(IconStyle())
                    // 通过“别名来使用”
                    .iconStyle()
            }
            .navigationTitle("Custom Modifiers")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

/// 为自定义 Modifier 起“别名”
extension View {
    func iconStyle() -> some View {
        modifier(IconStyle())
    }
}

/// 自定义 Modifier
struct IconStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemPink))
            .frame(width: 100, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
