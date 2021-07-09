//
//  NewImgModifier.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/9.
//

import SwiftUI

struct NewImgModifier: View {
    var body: some View {
        VStack {
            Image(systemName: "theatermasks")
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.blue)
                .font(.system(size: 144))
            
            Image(systemName: "shareplay")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .black)
                .font(.system(size: 144))
            
            Image(systemName: "person.3.sequence.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .green, .red)
                .font(.system(size: 144))
        }
    }
}

struct NewImgModifier_Previews: PreviewProvider {
    static var previews: some View {
        NewImgModifier()
    }
}
