//
//  LoginView.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginVM = LoginViewModel()
    @State var color = Color.black.opacity(0.7)
    @State var visible = false
    
    var body: some View {
        NavigationView{
           
            VStack{
                //Logo
                ZStack{
                    
                    Image("feeding")
                        .resizable()
                        .frame(width: 100,height:100)
                        //.padding(.top,0)
                    
                }
                
                //Form
                Text("Log in to your account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(self.color)
                    .padding(.top,35)
                
                
                TextField("Email", text: $loginVM.email)
                        .autocapitalization(.none)
                        .padding()
                        //.background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("specialPink") : self.color , lineWidth : 2 ))
                        .padding(.top,25)
                    
                HStack(spacing:15){
                        VStack{
                            if self.visible{
                                TextField("Password", text: $loginVM.password)
                                    .autocapitalization(.none)
                            }else{
                                SecureField("Password", text: $loginVM.password)
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
                    //.background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("specialPurple") : self.color , lineWidth : 2 ))
                    .padding(.top,25)
                    
                if !loginVM.error.isEmpty{
                    Text(loginVM.error)
                        .foregroundColor(Color("specialOrange"))
                }
                   
                
                HStack{
                    Spacer()
                    
                    Button(action:{
                       
                    }){
                        Text("Forget Password")
                            .fontWeight(.bold)
                            .foregroundColor(Color("specialPurple"))
                    }
                }
                .padding(.top,20)
                
                BigButtonView(title: "Login", action: {loginVM.login()})
                
                Spacer()
                VStack{
                    
                    Text("Don't you have an account?")
                        .foregroundColor(color)
                    NavigationLink("Register",destination: RegisterView())
                        .foregroundColor(Color("specialPurple"))
                        .fontWeight(.bold)
                       
                }.padding(.bottom,50)
               
            }
            .padding(.horizontal,25)
            
        }
    }
}

#Preview {
    LoginView()
}
