//
//  ToDoListViewViewModel.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//
import FirebaseFirestore
import Foundation

class ToDoListViewModel : ObservableObject {
    @Published var showNewItemView: Bool = false
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id : String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
