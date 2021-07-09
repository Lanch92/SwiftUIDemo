//
//  PrivacyText.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/9.
//

import SwiftUI

struct PrivacyText: View {
    @Environment(\.redactionReasons) var redactionReasons
    
    var body: some View {
        VStack {
            Text("Card Number")
                .font(.headline)
            
            if redactionReasons.contains(.privacy) {
                Text("[HIDDEN]")
            } else {
                Text("1234 5678 9012 3456")
                    .privacySensitive()
            }
        }
    }
}

struct PrivacyText_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyText()
    }
}
