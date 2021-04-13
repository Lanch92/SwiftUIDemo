//
//  ContentView.swift
//  SwiftUIAlerts
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct ContentView: View {

@State private var alertIsPresented = false
@State private var backgroundUpdated = false

var body: some View {
    NavigationView {
        ZStack {
            $backgroundUpdated.wrappedValue ?
                Color.red : Color.blue
            VStack {
                Button(action: {
                    self.alertIsPresented = true
                }, label: {
                    Text("Tap Me!")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 24))
                        .frame(width: 200, height: 50)
                })
                .background(Color.green)
                .cornerRadius(8)
                .alert(isPresented: $alertIsPresented) { () -> Alert in
                    
                    Alert(title: Text("Would you like to purchase?"), primaryButton: .default(Text("Purchase"), action: {
                        self.backgroundUpdated.toggle()
                    }), secondaryButton: .cancel(Text("No, Thanks!")))
//                        Alert(title: Text("Purchase Successful"), message: Text("Your in app purchase went through!"), dismissButton: .default(Text("Got It!")))
                }
            }
            .navigationTitle("SwiftUI Alerts")
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
}
}
