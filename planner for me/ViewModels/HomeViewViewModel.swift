//
//  HomeViewViewModel.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import FirebaseAuth
import Foundation

class HomeViewViewModel: ObservableObject{
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        //Add a listener to track user authentication state
        self.handler = Auth.auth().addStateDidChangeListener{
            [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    //Check if a user is signed in
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
