//
//  ContentView.swift
//  SwiftUIDownloadImages
//
//  Created by monkey on 2021/4/14.
//

import SwURL
import SwiftUI

struct ContentView: View {
    
    init() {
        SwURL.setImageCache(type: .persistent)
    }
    var body: some View {
        NavigationView {
            VStack {
                
                RemoteImageView(
                    url: URL(string: "https://www.iphonehacks.com/wp-content/uploads/2020/09/ios-14-features.png")!,
                    placeholderImage: Image(systemName: "photo"),
                    transition: ImageTransitionType.custom(transition: AnyTransition.opacity, animation: .easeIn(duration: 0.25)))
                    .progress({ progress in
                        return Text("Loaded \(progress)")
                    })
                    .aspectRatio(contentMode: .fit)
                
                Text("Loading Image")
            }
            .navigationTitle("Welcome")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
