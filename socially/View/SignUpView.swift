//
//  SignUpView.swift
//  socially
//
//  Created by Giovanni Maya on 3/1/24.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore
struct SignUpView: View {
    @ObservedObject var authModel = AuthViewModel()
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign Up")
                    .padding(.vertical, 10)
                Form {
                    Section{
                        TextField("Email", text: $emailAddress)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                        SecureField("Password", text: $password)
                    }
                    Section{
                        Button(action: {
                            authModel.signUp(emailAddress: emailAddress, password: password)
                        }) {
                            Text("Sign Up").foregroundColor(.blue).bold()
                        }
                    }
                }
            }
        }.padding(.vertical, 10)
    }
}


#Preview {
    SignUpView()
}
