//
//  RegisterView.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerVM = RegisterViewModel()
    @State var color = Color.black.opacity(0.7)
    @State var visible = false
    @State var revisible = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Image("feeding")
                    .resizable()
                    .frame(width: 100,height:100)
                    
                
                Text("Create your account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(self.color)
                    .padding(.top,35)
                
                TextField("Email", text: $registerVM.email)
                    .autocapitalization(.none)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(Color("specialPink") , lineWidth : 2 ))
                    .padding(.top,25)
                
                HStack(spacing:15){
                    VStack{
                        if self.visible{
                            TextField("Password", text: $registerVM.password)
                                .autocapitalization(.none)
                        }else{
                            SecureField("Password", text: $registerVM.password)
                                .autocapitalization(.none)
                        }
                        
                    }
                    Button(action: {
                        self.visible.toggle()
                    }){
                        Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(self.color)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color("specialPurple") , lineWidth : 2 ))
                .padding(.top,25)
                
                HStack(spacing:15){
                    VStack{
                        if self.revisible{
                            TextField("Re-enter Password", text: $registerVM.repassword)
                                .autocapitalization(.none)
                        }else{
                            SecureField("Re-enter Password", text: $registerVM.repassword)
                                .autocapitalization(.none)
                        }
                        
                    }
                    Button(action: {
                        self.revisible.toggle()
                    }){
                        Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(self.color)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color("specialPurple") , lineWidth : 2 ))
                .padding(.top,25)
                
                if !registerVM.error.isEmpty{
                    Text(registerVM.error)
                        .foregroundColor(Color("specialOrange"))
                }
                
                BigButtonView(title: "Register",
                              action: {registerVM.register()}
                )
                
                Spacer()
                
                
            }.padding(.horizontal,25)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    RegisterView()
}
