//
//  ToDoListItemView.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var toDoListItemVM = ToDoListItemViewModel()
    let item : ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                
                Text(item.title)
                    .font(.title)
                    .foregroundColor(.black.opacity(0.7))
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date:.abbreviated, time:.shortened))")
                        .font(.footnote)
                        .foregroundColor(Color("specialOrange"))
                    //.listStyle(PlainListStyle())
            }
            .padding(.horizontal,20)
            
            Spacer()
            Button(action: {
                toDoListItemVM.status(item: item)
            }, label: {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color("specialPink"))
            }
                   )
        }
        
        
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id:"123",
        title:"örnek",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isCompleted: false
        )
    )
}
