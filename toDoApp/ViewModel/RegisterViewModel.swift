//
//  RegisterViewViewModel.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel : ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repassword: String = ""
    @Published var error = ""
    
    @Published var alert = false
    @Published var show = false
    
    init(){
        
    }
    
    func register(){
        guard validate() else{
        return
        }
        Auth.auth().createUser(withEmail: email, password: password){[weak self] result , err in
            guard let userID = result?.user.uid else{
                if err != nil{
                    
                    self?.error = err!.localizedDescription
                    
                    return
                }
                return
            }
            // insert edilicek
            self?.insertUser(id: userID)
        }
    }
    
    private func insertUser(id: String){
        let newUser = User(id: id, email: email)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !repassword.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            error = "Please fill all the contents properly"
           return false
        }
        
        guard email.contains("@") && email.contains(".")
        else{
             error = "Please enter a valid email"
            return false
              }
        guard password.count >= 6 else{
            error = "Password must be at least 6 characters"
            return false
        }
        
        guard password == repassword else{
            error = "Passwords do not match"
            return false
        }
        
        return true
    }
    
    func register1(){
        if self.email != "" {
            if self.password == self.repassword{
                Auth.auth().createUser(withEmail: self.email, password: self.password){(res, err) in
                    if err != nil{
                        
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    print("success")
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    //Kayıt başarılı olduğunda login sayfasına yönlendirilir
                    self.show.toggle()
                }
            }else{
                self.error = "Password mismatch"
                self.alert.toggle()
                
            }
        }else{
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
}
