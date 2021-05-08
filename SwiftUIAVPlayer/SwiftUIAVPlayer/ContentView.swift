//
//  ContentView.swift
//  SwiftUIAVPlayer
//
//  Created by monkey on 2021/5/8.
//

import AVKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=-h8pk2pe7Xo&list=PLuoeXyslFTuaZtX7xSYbWz3TR0Vpz39gK&index=13")!)) {
            VStack {
                Text("Watermark")
                    .font(.caption)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Capsule())
                
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
