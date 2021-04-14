//
//  SideMenuView.swift
//  SwiftUISideMenu
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI

struct SideMenuView: View {
    
    var width: CGFloat
    var drawerOpend: Bool
    var toggleDrawer: () -> Void
    
    var body: some View {
        
        ZStack() {
            
            GeometryReader { _ in
                // 需要 GeometryReader 来提供空间
                EmptyView()
            }
            .background(Color.gray.opacity(0.15))
            .opacity(drawerOpend ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                toggleDrawer()
            }
            .ignoresSafeArea()
            
            HStack {
                MenuContent()
                    .frame(width: width)
                    .offset(x: drawerOpend ? 0 : -width)
                    .animation(.default)
                Spacer()
            }
        }
    }
}

struct MenuItem: Identifiable {
    var id = UUID()
    
    let text: String
    let imageName: String
    
    let handler: () -> Void = {
        print("Tapped")
    }
}

struct MenuContent: View {
    
    let items: [MenuItem] = [
        MenuItem(text: "Home", imageName: "house"),
        MenuItem(text: "Settings", imageName: "gear"),
        MenuItem(text: "Profile", imageName: "person.circle"),
        MenuItem(text: "Activity", imageName: "bell"),
        MenuItem(text: "Flights", imageName: "airplane"),
        MenuItem(text: "Share", imageName: "square.and.arrow.up")
    ]
    
    var body: some View {
        
        ZStack {
            Color(UIColor(
                    displayP3Red: 43 / 255.0,
                    green: 40 / 255.0,
                    blue: 74 / 255.0,
                    alpha: 1))
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                ForEach(items) { item in
                    HStack() {
                        
                        Image(systemName: item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                        
                        Text(item.text)
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                        
                        Spacer()
                    }
                    .onTapGesture {
                        item.handler()
                    }
                    .padding()
                    Divider()
                }
                Spacer()
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(width: 370, drawerOpend: true, toggleDrawer: {
            
        })
    }
}
