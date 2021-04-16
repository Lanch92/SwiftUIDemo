//
//  ContentView.swift
//  SwiftUIMap
//
//  Created by monkey on 2021/4/14.
//  SwiftUI2.0 提供了 Map

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var resion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.03, longitude: 102.67), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { reader in
                    VStack {
                        MapView()
                            .frame(width: reader.size.width, height:  reader.size.height * 0.5)
                        Spacer()
                        Map(coordinateRegion: $resion)
                            .frame(width: reader.size.width, height:  reader.size.height * 0.5)
                    }
                }
            }
            .navigationTitle("SwiftUI Map")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
