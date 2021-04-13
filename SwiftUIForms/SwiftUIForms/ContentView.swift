//
//  ContentView.swift
//  SwiftUIForms
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

class FormViewModel: NSObject, ObservableObject {
    
    @State var firstName = ""
    var lastName = ""
    var password = ""
    var passwordAgain = ""
    
    var streetAddress = ""
    var city = ""
    var state = ""
    var postalCode = ""
    var country = ""
    
    /// 前提要求：只能重置 @Published 修饰的属性（严格来说就是 @Published 修饰的属性的变化才能触发 UI 重构）
    func reset() {
        
        firstName = ""
        lastName = ""
        password = ""
        passwordAgain = ""
        
        streetAddress = ""
        city = ""
        state = ""
        postalCode = ""
        country = ""
    }
    
    override var debugDescription: String {
        """
            firstName: \(firstName)
            lastName: \(lastName)
            password: \(password)
            passwordAgain: \(passwordAgain)
            streetAddress: \(streetAddress)
            city: \(city)
            state: \(state)
            postalCode: \(postalCode)
            country: \(country)
        """
    }
}

struct ContentView: View {
    
    @StateObject private var formViewModel = FormViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("First Name", text: $formViewModel.firstName)
                        TextField("Last Name", text: $formViewModel.lastName)
                    }
                    
                    Section(footer: Text("Your password must be at least 8 characters long.")) {
                        SecureField("Create Password", text: $formViewModel.password)
                        SecureField("Confirm Password", text: $formViewModel.passwordAgain)
                    }
                    
                    Section(header: Text("Mailing Address")) {
                        TextField("Street Address", text: $formViewModel.streetAddress)
                        TextField("City", text: $formViewModel.city)
                        TextField("State", text: $formViewModel.state)
                        TextField("Postal Code", text: $formViewModel.postalCode)
                        TextField("Country", text: $formViewModel.country)
                    }
                }
                
                Button(action: {
                    
                    print(formViewModel.debugDescription)
                    formViewModel.reset()
                }, label: {
                    Text("Continue")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                
                Spacer()
            }
            .navigationTitle("Create Account")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
