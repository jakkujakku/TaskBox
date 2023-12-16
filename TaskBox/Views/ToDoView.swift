//
//  ToDoView.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import SwiftUI

struct ToDoView: View {
    @ObservedObject var viewModel = ToDoViewModel()
    @State var textContent: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Content Title", text: $textContent)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .textFieldStyle(.roundedBorder)
                List {
                    ForEach(viewModel.todoList, id: \.self) { todo in
                        Text(todo.title)
                    }
                    .onDelete(perform: { index in
                        viewModel.deleteData(index: index)
                    })
                    .onMove(perform: { indices, newOffset in
                        viewModel.moveData(index: indices, destination: newOffset)
                    })
                }
                .listStyle(PlainListStyle())
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        let todo = ToDo(title: textContent, insertDate: .now)
                        viewModel.addData(todo: todo)
                        textContent = ""
                    }, label: {
                        Text("Add")
                    })
                    EditButton()
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
