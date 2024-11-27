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
            TabView{
                ToDoListView()
                    .tabItem{
                        Label("Home",systemImage:"house")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage:"person.circle")
                    }
            }
        }else{
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
