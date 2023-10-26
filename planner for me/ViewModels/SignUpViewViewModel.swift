//
//  SignUpViewViewModel.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class SignUpViewViewModel: ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    //Sign up a new user
    func signUp(){
        guard validate()
        else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result, error in
            guard let userID = result?.user.uid
            else{
                return
            }
            self?.insertUserRecord(id: userID)
        }
    }
    
    //Insert user record into Firestore
    private func insertUserRecord(id: String){
        let newUser = User(
            id: id,
            name: name,
            email: email,
            joined: Date().timeIntervalSinceNow
        )
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    //Validate user input for registration
    private func validate() -> Bool {
        guard
            !name.trimmingCharacters(in: .whitespaces).isEmpty,
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
        guard password.count >= 6 else {
            errorMessage = "Please, enter a valid password"
            return false
        }
        return true
    }
}
