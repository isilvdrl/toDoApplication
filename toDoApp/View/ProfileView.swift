//
//  ProfileView.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileVM = ProfileViewModel()
    init(){
        
    }
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = profileVM.user{
                    profile(user: user)
                }else{
                    Text("Profile is updating...")
                }
                
                BigButtonView(title: "Logout", action: {
                    profileVM.logout()}
                )
            }
            .navigationTitle("Profile")
            
        }.onAppear{
            profileVM.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User)->some View{
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundStyle(Color("specialPurple"))
        
        VStack{
            HStack{
                Text("Email:")
                Text(user.email)
            }
        }

    }
}

#Preview {
    ProfileView()
}
