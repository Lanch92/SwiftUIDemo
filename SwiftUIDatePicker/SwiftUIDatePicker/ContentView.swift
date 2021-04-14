//
//  ContentView.swift
//  SwiftUIDatePicker
//
//  Created by monkey on 2021/4/14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Trip Date",
                           selection: $date,
                           in: ...Date())
//                           displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
            }
            .navigationTitle("Select Dates")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
