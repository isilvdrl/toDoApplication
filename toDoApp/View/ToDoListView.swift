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
                Image("Designer")
                    .resizable()
                    .frame(width: 40,height: 40)
                
                List(items){item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button(action:{
                                toDoListVM.delete(id: item.id)
                            }){
                                Text("Delete")
                                    .padding()
                                    .cornerRadius(8)
                            }
                                
                            
                                
                        }
                    
                }
                //.listStyle(PlainListStyle())
                //.padding(.horizontal,20)
            }
            .toolbar{
                Button{
                    toDoListVM.showNewItemView = true
                } label:{
                    Image(systemName: "plus" )
                        .foregroundColor(Color("specialPink"))
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
