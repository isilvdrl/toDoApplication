//
//  ProfileViewViewModel.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel : ObservableObject{
    @Published var user : User? = nil
    init(){
        
    }
    func fetchUser(){
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID).getDocument { (snapshot, error) in
                guard let data = snapshot?.data(), error == nil else{return}
                
                DispatchQueue.main.async {
                    self.user = User(
                        id: data["id"] as? String ?? "", email: data["email"] as? String ?? ""
                    )
                }
            }
    }
    
    func logout(){
        do{
            try Auth.auth().signOut()
        }catch{
            print("error")
        }
    }
}
