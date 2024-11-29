//
//  LoginViewViewModel.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    @Published var alert = false
    @Published var show = true
    
    init(){
        
    }
    func login(){
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
             error = "Please fill all the contents properly"
            return false
              }
        guard email.contains("@") && email.contains(".")
        else{
             error = "Please enter a valid email"
            return false
              }
        return true
    }
    //
    func verify(){
        if self.email != "" && self.password != ""{
            Auth.auth().signIn(withEmail: self.email, password: self.password){(res,err) in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name.init("status"), object: nil)
                self.show = false
            }
        }else{
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }

    func reset(){
        if self.email != ""{
            Auth.auth().sendPasswordReset(withEmail: self.email){ (err) in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.error = "RESET"
                self.alert.toggle()
                
            }
        }else{
            self.error = "Email is empty"
            self.alert.toggle()
        }
    }
}
