//
//  ContentView.swift
//  SwiftUIGauge WatchKit Extension
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct ContentView: View {
    
    let gradient = Gradient(colors: [.blue, .pink, .purple, .orange])
    
    let gradient1 = Gradient(stops: [.init(color: .pink, location: 0.2), .init(color: .purple, location: 0.9), .init(color: .orange, location: 1.0)])
    
    var body: some View {
        Gauge(value: 33.5, in: 0.0...100.0) {
            Text("Speed")
                .foregroundColor(.blue)
        } currentValueLabel: {
            Text("33.5")
                .foregroundColor(.blue)
        } minimumValueLabel: {
            Text("0")
                .foregroundColor(.blue)
        } maximumValueLabel: {
            Text("100")
                .foregroundColor(.blue)
        }
        .gaugeStyle(CircularGaugeStyle(tint: gradient))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
