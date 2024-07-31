//
//  ProfileView.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModal = ProfileViewViewModal()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModal.user{
                    profile(user: user)
                }else{
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModal.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125,height: 125)
            .padding()
        
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email:  ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
         
        //Sıgnout
        Button("Log Out"){
            viewModal.logOut()
        }
        .tint(.red)
        .padding()
        Spacer()

    }
}

#Preview {
    ProfileView()
}
