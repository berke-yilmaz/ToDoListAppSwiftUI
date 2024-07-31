//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModal : ToDoListViewViewModal
    @FirestoreQuery var items: [ToDoListItem]
     
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModal = StateObject(wrappedValue: ToDoListViewViewModal(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModal.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModal.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModal.showingNewItemView) {
                NewItemView(newItemPresented:  $viewModal.showingNewItemView)
            }
        }
        
    }
}

#Preview {
    ToDoListView(userId: "VxXvd3uL2XfRBmFI3uGSmV3HhDa2")
}
