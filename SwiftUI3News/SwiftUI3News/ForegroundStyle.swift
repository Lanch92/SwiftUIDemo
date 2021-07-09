//
//  ForegroundStyle.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct ForegroundStyle: View {
    var body: some View {
        
        HStack {
            Image(systemName: "clock.fill")
            Text("Set the time")
        }
        .font(.largeTitle.bold())
        .foregroundStyle(
            .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

struct ForegroundStyle_Previews: PreviewProvider {
    static var previews: some View {
        ForegroundStyle()
    }
}
