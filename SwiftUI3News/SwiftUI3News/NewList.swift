//
//  NewList.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var name: String
    var isContacted = false
}

struct NewList: View {
    @State private var users = [
        User(name: "Taylor"),
        User(name: "Adele"),
        User(name: "Justin")
    ]
    
    var body: some View {
//        List(users) { user in
//            Text(user.name)
//            Spacer()
//            // 修改结构图的属性是不被允许的
//            Toggle("User has been contacted", isOn: user.isContacted)
//                .labelsHidden()
//        }
        List($users) { $user in
            Text(user.name)
            Spacer()
            // 使用属性包装
            Toggle("User has been contacted", isOn: $user.isContacted)
                .labelsHidden()
        }
    }
}

struct NewList_Previews: PreviewProvider {
    static var previews: some View {
        NewList()
    }
}
