//
//  LoginViewViewModal.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//

import Foundation
import FirebaseAuth

class LoginViewViewModal: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    func login(){
     
        if !validate() {
            return
        }
        //try to login
        
        Auth.auth().signIn(withEmail:  email, password: password)
        
        
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        if email.trimmingCharacters(in: .whitespaces).isEmpty && password.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Please fill in all fields"
            return false
        }
        if (!email.contains("@") && email.contains(".")){
            errorMessage = "Please enter valid email"
            return false
        }
         
        return true
    }
    
}
