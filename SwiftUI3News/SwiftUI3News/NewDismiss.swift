//
//  NewDismiss.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct NewDismiss: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct NewDismiss_Previews: PreviewProvider {
    static var previews: some View {
        NewDismiss()
    }
}
