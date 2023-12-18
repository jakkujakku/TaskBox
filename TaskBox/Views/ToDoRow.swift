//
//  ToDoRow.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import SwiftUI

struct ToDoRow: View {
    internal var title: String
    internal var date: Date
    @Binding var isCompleted: Bool

    var body: some View {
        HStack(alignment: .center) {
            Text(title)
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
        ToDoRow(title: "Title", date: .now, isCompleted: .constant(false))
    }
}
