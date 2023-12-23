//
//  ToDoView.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import SwiftUI

struct ToDoView: View {
    @StateObject var viewModel = ToDoViewModel()
    @State private var textContent: String = ""
    @State private var isShowAlert = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.todoList) { todo in
                        if let index = viewModel.todoList.firstIndex(where: { $0.id == todo.id }) {
                            ToDoRow(item: todo, isCompleted: $viewModel.todoList[index].isCompleted)
                                .frame(height: 50)

                                .onChange(of: viewModel.todoList[index].isCompleted) { newValue in
                                    viewModel.handleCompletionChange(of: todo, isCompleted: newValue)
                                }
                        }
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

    func change(_ isChanged: Bool) {
        isChanged ? print("#### True") : print("#### False")
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
