//
//  RegisterView.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModal = RegisterViewViewModal()
    
    var body: some View {
        VStack{
            //header
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
        }
        Form{
            TextField("Full Name",text: $viewModal.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email Address",text: $viewModal.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
                                                        
            SecureField("Password",text: $viewModal.password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            TLButton(title:  "Create Account", background: .green){
                viewModal.register()
            }
        
        }
        .offset(y:-50)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
