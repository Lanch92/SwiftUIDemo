//
//  ContentView.swift
//  SwiftUIBlur
//
//  Created by monkey on 2021/6/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let frame = proxy.frame(in: .global)
                
                Image("sunset")
                    .resizable()
                    .frame(width: frame.width, height: frame.height)
            }
            
            GeometryReader { proxy in
                BlurView(style: .systemThinMaterialDark)
            }
        }
        .ignoresSafeArea()
    }
}

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // do nothing
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
