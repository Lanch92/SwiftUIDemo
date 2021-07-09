//
//  AnimationWithValue.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct AnimationWithValue: View {
    @State private var scaleUp = true
    
    var body: some View {
        Text("First")
             .scaleEffect(scaleUp ? 2 : 1)
             // 造成不关心的变量（设备旋转）导致动画
             // .animation(.linear(duration: 1))
             // 只响应关心的变量（scaleUp）导致的动画
             // 也可以使用 withAnimation 来解决
             .animation(.linear(duration: 1), value: scaleUp)
             .onTapGesture {
                 scaleUp.toggle()
             }
    }
}

struct AnimationWithValue_Previews: PreviewProvider {
    static var previews: some View {
        AnimationWithValue()
    }
}
