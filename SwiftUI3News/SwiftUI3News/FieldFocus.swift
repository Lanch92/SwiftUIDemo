//
//  FieldFocus.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct FieldFocus: View {
    
    enum Field {
        case firstName, lastName, emailAddress
    }
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""
    
    @FocusState private var focusField: Field?
    
    var body: some View {
        // 这里不能使用 Form、List？？？
        VStack {
            
            TextField("Enter your first name", text: $firstName)
                .padding()
                .focused($focusField, equals: .firstName)
                .textContentType(.givenName)
                .submitLabel(.next)
            
            TextField("Enter your last name", text: $lastName)
                .padding()
                .focused($focusField, equals: .lastName)
                .textContentType(.familyName)
                .submitLabel(.next)
            
            TextField("Enter your email address", text: $emailAddress)
                .padding()
                .focused($focusField, equals: .emailAddress)
                .textContentType(.emailAddress)
                .submitLabel(.join)
            
        }
        .onSubmit {
            switch focusField {
            case .firstName:
                focusField = .lastName
            case .lastName:
                focusField = .emailAddress
            default:
                print("Join chat room...")
            
            }
        }
    }
}

struct FieldFocus_Previews: PreviewProvider {
    static var previews: some View {
        FieldFocus()
    }
}
