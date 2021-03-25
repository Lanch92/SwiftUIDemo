//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by monkey on 2020/12/19.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark -> Bool in
            (!showFavoriteOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoriteOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: {$0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        print("#dsohandle4", #dsohandle)
        return NavigationView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.large)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) {category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(InlinePickerStyle())
                        
                        Toggle(isOn: $showFavoriteOnly, label: {
                            Text("Favorites Only")
                        })
                        
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
