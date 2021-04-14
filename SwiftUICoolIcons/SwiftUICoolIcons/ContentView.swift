//
//  ContentView.swift
//  SwiftUICoolIcons
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("materialIcon access_alarm")
                Spacer()
                FontIcon.text(.materialIcon(code: .access_alarm))
            }
            .padding()
            
            HStack {
                Text("materialIcon access_alarm")
                Spacer()
                FontIcon.text(.materialIcon(code: .access_alarm), fontsize: 30)
            }
            .padding()
            
            HStack {
                Text("ionicon md_add_circle")
                Spacer()
                FontIcon.button(.ionicon(code: .md_add_circle), action: {})
            }
            .padding()
            
            HStack {
                Text("materialIcon settings")
                Spacer()
                FontIcon.button(.materialIcon(code: .settings), action: {}, padding: 8)
                    .background(RoundedRectangle(cornerRadius: 4).foregroundColor(.blue))
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
