//
//  ProfileViewViewModel.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject{
    init(){}
    
    @Published var user: User? = nil
    
    //Fetch user data from Firestore
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid
        else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .getDocument{
                [weak self] snapshot,
                error in guard let data = snapshot?.data(), error == nil
                else {
                    return
                }
                DispatchQueue.main.async{
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["joined"] as? TimeInterval ?? 0
                    )
                }
            }
    }
    
    //Sign out 
    func signOut(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
}
