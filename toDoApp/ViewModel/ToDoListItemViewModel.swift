//
//  ToDoListItemViewViewModel.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewModel: ObservableObject{
    init(){}
    func status(item : ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isCompleted)
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("toDo")
            .document(item.id)
            .setData(itemCopy.asDictionary())
            
    }
}
