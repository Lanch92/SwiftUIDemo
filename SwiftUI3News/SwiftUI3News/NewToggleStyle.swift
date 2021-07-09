//
//  NewToggleStyle.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct NewToggleStyle: View {
    @State private var isOn = false
    
    var body: some View {
        
        Toggle("Filter", isOn: $isOn)
            .toggleStyle(.button)
            .tint(.mint)
    }
}

struct NewToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        NewToggleStyle()
    }
}
