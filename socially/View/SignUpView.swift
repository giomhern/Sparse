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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("Sign Up").font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                Text("Create an account to post your best photos on the best platform Socially")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Spacer()
            }.padding(.horizontal, 10)
        }
    }
}


#Preview {
    SignUpView()
}
