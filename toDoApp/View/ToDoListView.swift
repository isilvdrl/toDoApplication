//
//  ToDoListView.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var toDoListVM = ToDoListViewModel()
    private let userID: String
    
    init(userID: String){
        self.userID = userID
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("ToDo List")
            .toolbar{
                Button{
                    
                } label:{
                    Image(systemName: "plus" )
                }
            }
        }
    }
}

#Preview {
    ToDoListView(userID:"xcfdxfsfdf")
}
