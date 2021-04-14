//
//  MapView.swift
//  SwiftUIMap
//
//  Created by monkey on 2021/4/14.
//

import UIKit
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var coordinate = CLLocationCoordinate2D(latitude: 25.03, longitude: 102.67)
    
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let map = MKMapView()
        
        map.setRegion(MKCoordinateRegion(
                        center: coordinate,
                        span: MKCoordinateSpan(
                            latitudeDelta: 0.07,
                            longitudeDelta: 0.07)),
                      animated: true)
        
        view.addSubview(map)
        
        map.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            map.widthAnchor.constraint(equalTo: view.widthAnchor),
            map.heightAnchor.constraint(equalTo: view.heightAnchor),
            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            map.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        map.addAnnotation(pin)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
