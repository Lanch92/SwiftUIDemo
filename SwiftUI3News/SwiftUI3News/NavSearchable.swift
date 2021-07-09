//
//  NavSearchable.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct NavSearchable: View {
    
    private let names = ["Eric", "Ted", "Paul"]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Searching for \(searchText)")
                
                List(results, id: \.self) { name in
                    NavigationLink(destination: Text(name)) {
                        Text(name)
                    }
                }
            }
            .searchable(text: $searchText) {
                // Text("🍎").searchCompletion("apple")
                // Text("🍐").searchCompletion("pear")
                
                // 这种方式错误，searchCompletion 不能使用 searchable 相同的 searchText
                // Text("You look like searching \(searchText)?")
                //   .searchCompletion(searchText)
                ForEach(results, id: \.self) { name in
                    Text("You look like searching \(name)?")
                        .searchCompletion(name)
                }
            }
        }
    }
    
    var results: [String] {
        if searchText.isEmpty {
            return names
        }
        
        return names.filter { name -> Bool in
            name.lowercased().contains(searchText.lowercased())
        }
    }
}

struct NavSearchable_Previews: PreviewProvider {
    static var previews: some View {
        NavSearchable()
    }
}
