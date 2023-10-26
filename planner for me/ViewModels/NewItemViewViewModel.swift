//
//  NewItemViewViewModel.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    //Save a new to-do item
    func save(){
        guard canSave
        else {
            return
        }
        guard let userID = Auth.auth().currentUser?.uid
        else {
            return
        }
        
        let newID = UUID().uuidString
        let newItem = ToDoListItem(
            id: newID,
            title: title,
            dueDate: dueDate.timeIntervalSinceNow,
            createDate: Date().timeIntervalSinceNow,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    //Check if a new item can be saved
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400)
        else{
            return false
        }
        return true
    }
}
