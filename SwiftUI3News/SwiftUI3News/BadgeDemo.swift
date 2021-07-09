//
//  BadgeDemo.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct BadgeDemo: View {
    var body: some View {
        TabView {
            // 如果外层有 badge，则内层的 badge 无效
            List {
                Text("Wi-Fi")
                    .badge("Guyijia")
                
                Text("Bluetooth")
                    .badge("On")
            }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .badge(5)
        }
    }
}

struct BadgeDemo_Previews: PreviewProvider {
    static var previews: some View {
        BadgeDemo()
    }
}
