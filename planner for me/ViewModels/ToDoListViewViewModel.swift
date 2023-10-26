//
//  ToDoListViewViewModel.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    
    private let userID: String
    
    init(userID: String){
        self.userID = userID
    }
    
    //Delete a to-do item
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
}
