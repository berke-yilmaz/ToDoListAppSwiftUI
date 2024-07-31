import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModal: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false  // Initialize to false

    init() {}

    func save() {
        guard cansave else {
            return
        }
        
        // Get current user ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create a new item with a unique ID
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Save the new item to Firestore
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)  // Use newId instead of "123"
            .setData(newItem.asDictionary())
    }

    var cansave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
