//
//  ContentView.swift
//  SwiftUIGradients
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
//                    Color(UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)),
                    // myColor: 在 Assets 中定义的 Color Set 的名字
                    Color("myColor"),
                    Color(.systemPink),
                ]),
                startPoint: .top,
                endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "sun.max.fill")
//                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220, height: 220)
                    .padding()
                Text("Sunny")
                    .font(.system(size: 43, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
