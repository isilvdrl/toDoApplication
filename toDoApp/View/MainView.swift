//
//  ContentView.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainVM = MainViewModel()
    
    var body: some View {
        if mainVM.isSignedIn, !mainVM.currentUserID.isEmpty {
            accountView
        }else{
            LoginView()
        }
        
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userID: mainVM.currentUserID)
                .tabItem{
                    Label("Home",systemImage:"house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage:"person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
