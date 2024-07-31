//
//  ToDoListItemViewViewModal.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

//for each row
class ToDoListItemViewViewModal: ObservableObject {
    init(){}
    
    
    func toggleIsDone(item: ToDoListItem ){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}
 
