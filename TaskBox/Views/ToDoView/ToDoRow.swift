//
//  ToDoRow.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import SwiftUI

struct ToDoRow: View {
    var item: ToDo
    @Binding var isCompleted: Bool

    var body: some View {
        HStack(alignment: .center) {
            Text(item.title)
                .font(.system(size: 30, weight: .bold))
                .strikethrough(isCompleted ? true : false, color: .gray.opacity(0.4))
                .foregroundStyle(isCompleted ? .gray.opacity(0.4) : .black)

            Spacer()

            Toggle("", isOn: $isCompleted)
        }
    }
}

struct ToDoRow_Previews: PreviewProvider {
    static var previews: some View {
        let todo = ToDo(title: "Hello World", insertDate: .now, isCompleted: false)
        ToDoRow(item: todo, isCompleted: .constant(false))
    }
}
