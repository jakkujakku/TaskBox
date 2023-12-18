//
//  ToDoView.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import SwiftUI

struct ToDoView: View {
    @ObservedObject var viewModel = ToDoViewModel()
    @State private var textContent: String = ""
    @State private var isShowAlert = false

    var body: some View {
        NavigationView {
            VStack {
//                TextField("Enter Content Title", text: $textContent)
//                    .padding()
//                    .background(Color(uiColor: .secondarySystemBackground))
//                    .textFieldStyle(.roundedBorder)
                List {
                    ForEach(viewModel.todoList) { todo in
                        ToDoRow(title: todo.title,
                                date: todo.insertDate,
                                isCompleted: $viewModel.todoList[viewModel.todoList.firstIndex(where: { $0.id == todo.id })!].isCompleted)
                            .frame(height: 50)
                    }

                    .onDelete(perform: { index in
                        viewModel.deleteData(index: index)
                    })
                    .onMove(perform: { indices, newOffset in
                        viewModel.moveData(index: indices, destination: newOffset)
                    })
                }
                .listStyle(.plain)

                HStack {
                    Spacer()

                    Button(action: {
                        isShowAlert = true
//                        let todo = ToDo(title: textContent, insertDate: .now, isCompleted: false)
//                        viewModel.addData(todo: todo)
//                        textContent = ""
                    }, label: {
                        FloattingButton()
                    })
                    .alert("To Do Task", isPresented: $isShowAlert) {
                        TextField("Enter Content Title", text: $textContent)
                        Button("Save", action: {
                            let todo = ToDo(title: textContent, insertDate: .now, isCompleted: false)
                            viewModel.addData(todo: todo)
                            textContent = ""
                        })
                    } message: {
                        Text("Please Enter your task name.")
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
