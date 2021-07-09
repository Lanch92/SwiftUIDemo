//
//  NewSideBar&Refreshable.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct NewSideBar_Refreshable: View {
    
    @State private var name = "Tim"
    
    var body: some View {
        VStack(spacing: 8) {
            TextField("Enter your name", text: $name)
                .padding()
                .textFieldStyle(.roundedBorder)
#if os(iOS)
                .submitLabel(.join)
#endif
            
            List(0..<51) {
                Text("\($0)")
            }
            .listStyle(.sidebar)
            .refreshable {
                print("Refresh")
            }
        }
    }
}

struct NewSideBar_Refreshable_Previews: PreviewProvider {
    static var previews: some View {
        NewSideBar_Refreshable()
    }
}
