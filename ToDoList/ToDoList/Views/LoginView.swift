//
//  LoginView.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModal = LoginViewViewModal()
    
    var body: some View {
        NavigationView{
            VStack{
                //header
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, background: .pink)
                //login form
               
                Form{
                    if !viewModal.errorMessage.isEmpty {
                        Text(viewModal.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModal.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $viewModal.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        
                    TLButton(title:  "Log in", background: .blue){
                        viewModal.login()
                    }
                }
                .offset(y: -50)
                
                //create account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                    
                }
                .padding(.bottom, 50)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
