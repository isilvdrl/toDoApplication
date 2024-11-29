//
//  ToDoListView.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject var toDoListVM : ToDoListViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    
    init(userID: String){
        
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/toDo")
        self._toDoListVM = StateObject(wrappedValue: ToDoListViewModel(userId: userID))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button(action:{
                                toDoListVM.delete(id: item.id)
                            },
                                   label: {Text("Delete")}
                            )
                                .foregroundColor(Color("specialOrange"))
                        }
                    
                }
                //.listStyle(PlainListStyle())
                .padding(.horizontal,20)
            }
            .navigationTitle("ToDo List")
            .toolbar{
                Button{
                    toDoListVM.showNewItemView = true
                } label:{
                    Image(systemName: "plus" )
                }
            }
            .sheet(isPresented: $toDoListVM.showNewItemView,
                   content:{
                    NewItemView(showNewItemView: $toDoListVM.showNewItemView)
                    }
            )
        }
    }
}

#Preview {
    ToDoListView(userID:"AZwflajBSVSs5DZUuVWbzwrXL8J2")
}
