//
//  GestureTest.swift
//  SwiftUIDemo
//
//  Created by monkey on 2020/12/22.
//

import SwiftUI

struct GestureTest: View {
    
    @GestureState var isDetectingLongPress = false
    @State var totalNumberOfTaps = 0
    @State var doneCounting = false
    
    var body: some View {
        
        let press = LongPressGesture(minimumDuration: 1)
            .updating($isDetectingLongPress) { (currentState, gestureState, transaction) in
                gestureState = currentState
            }
            .onChanged { _ in
                totalNumberOfTaps += 1
                print(totalNumberOfTaps)
            }
            .onEnded { _ in
                doneCounting = true
            }
        
        VStack {
            Text("\(totalNumberOfTaps)")
                .font(.largeTitle)
            
            Circle()
                .fill(doneCounting ? Color.red : isDetectingLongPress ? Color.yellow : Color.green)
                .gesture(doneCounting ? nil : press)
        }
    }
}

struct GestureTest_Previews: PreviewProvider {
    static var previews: some View {
        GestureTest()
    }
}
