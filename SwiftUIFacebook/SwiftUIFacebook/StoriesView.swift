//
//  StoriesView.swift
//  SwiftUIFacebook
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct StoriesView: View {
    
    let stories: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 3) {
                ForEach(stories, id: \.self) { name in
                    Image(name)
                        .resizable()
                        .frame(width: 140, height: 200)
                        .background(Color.red)
                }

            }
            .padding()
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView(stories: [])
    }
}
