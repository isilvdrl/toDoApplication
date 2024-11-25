//
//  toDoAppApp.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI
import FirebaseCore



@main
struct toDoAppApp: App {
    
    // register app delegate for Firebase setup
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
              MainView()
            }
        }
    }
}


