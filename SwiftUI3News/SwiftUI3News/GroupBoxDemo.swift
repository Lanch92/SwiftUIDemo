//
//  GroupBoxDemo.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct GroupBoxDemo: View {
    var body: some View {
        GroupBox("Important") {
            Text("Your account")
                .font(.headline)
            GroupBox {
                Text("Usernname: Sammy")
                GroupBox {
                    Text("City: Nashville")
                }
            }
        }
    }
}

struct GroupBoxDemo_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxDemo()
    }
}
