//
//  ToDoListItem.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isCompleted: Bool
    
    mutating func setDone(_ state: Bool)
    {
        isCompleted = state
    }
}
