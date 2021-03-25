//
//  CategoryHome.swift
//  SwiftUIDemo
//
//  Created by monkey on 2020/12/19.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        print("#dsohandle3", #dsohandle)
        return NavigationView {
            List {
                
                PageView(pages: ModelData()
                            .features
                            .map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                    
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar {
                Button(action: {
                    showingProfile.toggle()
                }, label: {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                })
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    // 这里传递是因为预览时需要使用，运行 app 时不需要传递
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
