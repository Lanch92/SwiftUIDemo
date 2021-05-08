//
//  OnBoardingView.swift
//  SwiftUIOnboardingUI
//
//  Created by monkey on 2021/5/7.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        TabView {
            PageView(imgName: "bell", title: "Push Notifications", subtitle: "Enable notifications to stay up to date with our app.", showDismissButton: false)
            
            PageView(imgName: "bookmark", title: "Bookmarks", subtitle: "Save your favorite pieces of content.", showDismissButton: false)
            
            PageView(imgName: "airplane", title: "Fights", subtitle: "Book flights to the places you want to go.", showDismissButton: false)
            
            PageView(imgName: "house", title: "Home", subtitle: "Go home whereever you might be.", showDismissButton: true) {
                shouldShowOnboarding.toggle()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    
    let imgName: String
    let title: String
    let subtitle: String
    let showDismissButton: Bool
    var getStartedAction: (() -> Void)?
    
    var body: some View {
        VStack {
            Image(systemName: imgName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
            
            Text(title)
                .font(.system(size: 32))
                .padding()
            
            Text(subtitle)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.secondaryLabel))
                .padding()
            
            if showDismissButton {
                Button(action: getStartedAction ?? {}, label: {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(6)
                })
            }
        }
    }
}
