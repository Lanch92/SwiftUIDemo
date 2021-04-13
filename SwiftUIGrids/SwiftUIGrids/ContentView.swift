//
//  ContentView.swift
//  SwiftUIGrids
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct ContentView: View {
    
    let items = Array(0...1000).map { "Element \($0)" }
    
    let layout = [
        
        // 这里的 column(row) 数根据 LazyVGrid(LazyHGrid) 来决定
        // 只有一个 adaptive 时：根据 adaptive 指定的 size 范围根据屏幕宽度适配 column 数
        // 多个 adaptive 时：adaptive 个数决定 column(row) 数，不会超出屏幕，此时 minimum 会被压缩（可以理解为无效）
//        GridItem(.adaptive(minimum: 100)),
//        GridItem(.adaptive(minimum: 100)),
//        GridItem(.adaptive(minimum: 100)),
//        GridItem(.adaptive(minimum: 100)),
//        GridItem(.adaptive(minimum: 100)),
//        GridItem(.adaptive(minimum: 100)),
        
        // 有多少个 flexible，就会有多少 column(row)，会超出屏幕（size 始终不会小于 minimum）
//        GridItem(.flexible(minimum: 100)),
//        GridItem(.flexible(minimum: 100)),
//        GridItem(.flexible(minimum: 100)),
//        GridItem(.flexible(minimum: 100)),
//        GridItem(.flexible(minimum: 100)),
//        GridItem(.flexible(minimum: 100)),
//        GridItem(.flexible(minimum: 100)),
        
        // fixed：根据指定宽度显示 item，有多少 fixed 就会有多少 column(row)，宽度为指定的值，会超出屏幕
        GridItem(.fixed(150)),
        GridItem(.fixed(100)),
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100)),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .padding()
                }
            }
        }
        
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: layout) {
//                ForEach(items, id: \.self) { item in
//                    Text(item)
//                        .padding()
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
