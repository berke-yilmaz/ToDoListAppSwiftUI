//
//  ContentView.swift
//  ToDoList
//
//  Created by Mac on 19.07.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModal = MainViewViewModal()
    
    var body: some View {
            if viewModal.isSignedIn, !viewModal.currentUserId.isEmpty{
                accountView
            }else{
                LoginView()
            }
        
    } 
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewModal.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView ()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
