//
//  ConditionDismissSheet.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct ExampleSheet: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var termsAccepted = false
    
    var body: some View {
        VStack {
            Text("Terms and conditions")
                .font(.title)
            Text("Lots of legalese here...")
            
            Toggle("Accept", isOn: $termsAccepted)
        }
        // 禁止下拉消失
        // 不满足条件的情况下禁止下拉消失
        .interactiveDismissDisabled(!termsAccepted)
    }
    
    func close() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct ConditionDismissSheet: View {
    @State private var showSheet = false
    
    var body: some View {
        
        Button("Show Sheet") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: ExampleSheet.init)
    }
}

struct ConditionDismissSheet_Previews: PreviewProvider {
    static var previews: some View {
        ConditionDismissSheet()
    }
}
