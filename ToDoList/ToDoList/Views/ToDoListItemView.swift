//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModal = ToDoListItemViewViewModal()
    let item: ToDoListItem

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))

            }
            Spacer()
            Button{
                viewModal.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "milk", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false))
}
