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
                
            }
            .navigationTitle("Profile")
            
        }
    }
}

#Preview {
    ProfileView()
}
