//
//  ContentView.swift
//  StretchyHeader
//
//  Created by monkey on 2021/6/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                // header
                GeometryReader { proxy in
                    let global = proxy.frame(in: .global)
                    
                    Image("poster")
                        .resizable()
                        .offset(y: global.minY > 0 ? -global.minY : 0)
                        .frame(height:
                            global.minY > 0 ? UIScreen.main.bounds.height / 2.2 + global.minY : UIScreen.main.bounds.height / 2.2)
                }
                .frame(height: UIScreen.main.bounds.height / 2.2)
                
                // list
                VStack {
                    ForEach(1...5, id: \.self) { num in
                        HStack {
                            Text("\(num)")
                                .bold()
                                .frame(height: 100)
                                .padding()
                                .font(.system(size: 24))
                            
                            Spacer()
                        }
                    }
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
