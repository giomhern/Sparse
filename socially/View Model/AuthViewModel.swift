//
//  AuthViewModel.swift
//  socially
//
//  Created by Giovanni Maya on 3/1/24.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    func signIn (
        emailAddress: String,
        password: String
    ){
        Auth.auth().signIn(withEmail: emailAddress, password: password)
    }
    
    func signUp(emailAddress: String, password: String){
        Auth.auth().createUser(withEmail: emailAddress, password: password) {
            result, error in
            if let error = error {
                print("Debug: error \(error.localizedDescription)")
            } else {
                print("Debug: user created successfully")
            }
        }
    }
}
