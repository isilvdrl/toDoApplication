//
//  NewItemView.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var newItemVM = NewItemViewModel()
    @Binding var showNewItemView: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .foregroundColor(Color("specialPurple"))
                .font(.title)
            
            TextField("Title", text: $newItemVM.title)
                .padding(.horizontal,20)
                .padding(.top,10)
            
            DatePicker("Bitiş Tarihi",selection: $newItemVM.dueDate)
                .datePickerStyle(GraphicalDatePickerStyle())
            
            BigButtonView(title: "Save",
                action:{
                    if newItemVM.canSave(){
                        newItemVM.save()
                        showNewItemView = false
                    }else{
                        newItemVM.showAlert = true
                    }
                })
            .alert(isPresented: $newItemVM.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill all fields."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    NewItemView( showNewItemView: Binding(get: { false }, set: { _ in }))
}
