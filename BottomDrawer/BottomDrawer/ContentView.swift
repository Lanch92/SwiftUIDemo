//
//  ContentView.swift
//  BottomDrawer
//
//  Created by monkey on 2021/6/2.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            HomeView()
            
            GeometryReader { proxy in
                ZStack {
                    // blur
                    BlurView(style: .systemThinMaterialDark)
                    
                    DrawerView()
                }
            }
            .offset(y: offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset = value.startLocation.y +  value.translation.height
                    }
            )
            .onAppear {
                offset = UIScreen.main.bounds.height - 250
            }
            // 放在这里不能拖动是因为 background 也是一个 view
            // 而 drag 是放在 GeometryReader 上
            //            .background(Color.red)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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

struct HomeView: View {
    var body: some View {
        GeometryReader { proxy in
            let frame = proxy.frame(in: .global)
            
            Image("picture")
                .resizable()
                .scaledToFill()
                .frame(width: frame.width, height: frame.height)
        }
    }
}

struct DrawerView: View {
    @State private var text = ""
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 200, height: 7)
                .foregroundColor(.white)
                .padding(.top, 7)
            
            TextField("Search", text: $text)
                .padding()
                .background(Color(.label))
                .foregroundColor(.white)
                .opacity(0.7)
                .cornerRadius(7)
                .padding(12)
            
            HStack(alignment: .center, spacing: 25) {
                Button(action: {}, label: {
                    Image(systemName: "bell")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                })
                
                Button(action: {}, label: {
                    Image(systemName: "airplane")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.yellow)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                })
                
                Button(action: {}, label: {
                    Image(systemName: "gear")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                })
                
                Button(action: {}, label: {
                    Image(systemName: "house")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                })
            }
            
            Spacer()
        }
    }
}
