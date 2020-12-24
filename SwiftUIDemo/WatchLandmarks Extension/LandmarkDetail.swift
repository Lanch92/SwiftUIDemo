//
//  LandmarkDetail.swift
//  WatchLandmarks Extension
//
//  Created by monkey on 2020/12/21.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {
            $0.id == landmark.id
        })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable()).scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite, label: {
                    Text("Favorite")
                })
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return Group {
            LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 6 - 44mm")
            LandmarkDetail(landmark: modelData.landmarks[1])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 6 - 40mm")
                }
    }
}
