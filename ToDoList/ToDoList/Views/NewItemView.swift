import SwiftUI

struct NewItemView: View {
    @StateObject var viewModal = NewItemViewViewModal()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("Title", text: $viewModal.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModal.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "Save", background: .pink) {
                    if viewModal.cansave {
                        viewModal.save()
                        newItemPresented = false
                    } else {
                        viewModal.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModal.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill and select a due date that makes sense"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in }))
}
