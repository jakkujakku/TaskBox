//
//  ToDoViewModel.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var todoList = DataManager.todoList

    func addData(todo: ToDo) {
        todoList.append(todo)
    }
    
    func deleteData(index: IndexSet) {
        todoList.remove(atOffsets: index)
    }
    
    func moveData(index: IndexSet, destination: Int) {
        todoList.move(fromOffsets: index, toOffset: destination)
    }
}
