//
//  SignInViewViewModel.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import FirebaseAuth
import Foundation

class SignInViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    //Sign in with email and password
    func signIn(){
        guard validate()
        else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    //Validate user input
    private func validate() -> Bool {
        guard
            !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Please, fill in all fields."
            return false
        }
        guard email.contains("@") && email.contains(".")
        else{
            errorMessage = "Please, enter a valid email."
            return false
        }
        return true
    }
}
