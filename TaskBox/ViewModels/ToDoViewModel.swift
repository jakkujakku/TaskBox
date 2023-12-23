//
//  ToDoViewModel.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var todoList: [ToDo] = DataManager.shared.todoList
    @Published var completedList: [Completed] = DataManager.shared.completedList

    func addData(todo: ToDo) {
        todoList.append(todo)
    }

    func deleteData(index: IndexSet) {
        todoList.remove(atOffsets: index)
    }

    func moveData(index: IndexSet, destination: Int) {
        todoList.move(fromOffsets: index, toOffset: destination)
    }

    func handleCompletionChange(of todo: ToDo, isCompleted: Bool) {
        if isCompleted {
            // 할 일을 완료 목록에 추가
            let item = Completed(id: todo.id, title: todo.title, insertDate: .now)
            completedList.append(item)

        } else {
            // 할 일을 완료 목록에서 제거
            let i = completedList.firstIndex(where: { $0.id == todo.id })
            completedList.remove(at: i!)
        }

        DataManager.shared.updateCompletedList(completedList)
    }
}
