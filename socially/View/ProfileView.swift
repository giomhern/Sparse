//
//  ProfileView.swift
//  socially
//
//  Created by Giovanni Maya on 3/2/24.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @State private var showSignUp: Bool = false
    @ObservedObject private var authModel = AuthViewModel()
    
    var body: some View{
        VStack(alignment: .center){
            if authModel.user != nil {
                Form {
                    Section("Your Account"){
                        Text(authModel.user?.email ?? "")
                    }
                    Button {
                        authModel.signOut()
                    } label: {
                        Text("Logout").foregroundColor(.red)
                    }
                }
            } else {
                Form {
                    Section("Your Account"){
                        Text("Seems like you are not logged in, create an account please")
                    }
                    Button{
                        showSignUp.toggle()
                    } label: {
                        Text("Sign Up").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).bold()
                    }.sheet(isPresented: $showSignUp){
                        SignUpView().presentationDetents([.medium, .large])
                    }
                }
            }
        }.onAppear{authModel.listenToAuthState()}
    }
}


#Preview {
    ProfileView()
}
