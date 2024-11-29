//
//  NewItemViewViewModel.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate = Date()
    @Published var showAlert: Bool = false
    
    init(){
        
    }
    func save(){
        guard canSave() else{
            return
        }
        // Kullanıcının uidsini alıyoruz
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        // newItem oluşturuyoruz
        let newItemId = UUID().uuidString
        
        let newItem = ToDoListItem(
            id: newItemId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isCompleted: false
        )
        // firestore'a ilgili user'ın altına newItemı kaydediyoruz
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("toDo")
            .document(newItemId)
            .setData(newItem.asDictionary())
        
    }
    
    func canSave() -> Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
    
}
