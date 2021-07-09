//
//  MarkdownText.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct MarkdownText: View {
    var body: some View {
        VStack {
            Text("This is regular text")
            Text("This is **bold** text")
            Text("This is *italic* text")
            Text("This is ***bold italic*** text")
            Text("~~A strikethrough exapmle~~")
            Text("Visit Apple: [click here](https://www.apple.com)")
        }
    }
}

struct MarkdownText_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownText()
    }
}
