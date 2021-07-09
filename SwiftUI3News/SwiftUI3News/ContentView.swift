//
//  ContentView.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/7.
//

import SwiftUI

class EvilStateObject: ObservableObject {
    @Published var changeCount = 0
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if Int.random(in: 1...5) == 1 {
                self.changeCount += 1
//                self.objectWillChange.send()
            }
        }
    }
}

struct ContentView: View {
    
    @StateObject private var evilObject = EvilStateObject()
    
    var body: some View {
        // debug only
        print(Self._printChanges())
        return Text("What could possibly go wrong?")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
