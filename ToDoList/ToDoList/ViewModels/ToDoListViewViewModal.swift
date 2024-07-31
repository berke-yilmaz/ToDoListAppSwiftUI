//
//  ToDoListViewViewModal.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModal: ObservableObject {
    
    @Published var showingNewItemView = false
    private let userId: String 
    
    init(userId : String){
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete { error in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                } else {
                    print("Document successfully removed!")
                }
            }
    }

    
    
}
