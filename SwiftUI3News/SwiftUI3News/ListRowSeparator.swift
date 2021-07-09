//
//  ListRowSeparator.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct ListRowSeparator: View {
    var body: some View {
        List(1..<100) { index in
            Text("Row \(index)")
                .background(.mint)
            // 没有生效???
                .listRowSeparator(.hidden)
                .listRowSeparatorTint(.red)
        }
        .listStyle(.grouped)
    }
}

struct ListRowSeparator_Previews: PreviewProvider {
    static var previews: some View {
        ListRowSeparator()
    }
}
