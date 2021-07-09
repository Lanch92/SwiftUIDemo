//
//  ListItemSwipeActions.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct ListItemSwipeActions: View {
    var body: some View {
        List {
            Text("Default1")
                .swipeActions {
                    Button {
                        print("trash")
                    } label: {
                        Image(systemName: "trash.circle.fill")
                    }
                    .tint(.red)
                }
            Text("Defaultw")
                .swipeActions {
                    Button {
                        print("bell")
                    } label: {
                        Image(systemName: "bell.slash.circle")
                    }
                    .tint(.green)
                }
            
            Text("Leading")
                .swipeActions(edge: .leading) {
                    Button {
                        print("Leading bell")
                    } label: {
                        Image(systemName: "bell.slash.circle")
                    }
                    .tint(.green)
                }
            
            
            Text("Trailing")
                .swipeActions(edge: .trailing) {
                    Button {
                        print("Trailing bell")
                    } label: {
                        Image(systemName: "bell.slash.circle")
                    }
                    .tint(.blue)
                }
            
            // allowsFullSwipe: true（默认）时，滑动一定距离会响应第一个事件（这里是 bell）
            Text("!allowsFullSwipe")
                .swipeActions(allowsFullSwipe: false) {
                    Button {
                        print("bell")
                    } label: {
                        Image(systemName: "bell.slash.circle")
                    }
                    .tint(.blue)
                    
                    Button {
                        print("trash")
                    } label: {
                        Image(systemName: "trash.circle.fill")
                    }
                    .tint(.blue)
                }
        }
    }
}

struct ListItemSwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        ListItemSwipeActions()
    }
}
