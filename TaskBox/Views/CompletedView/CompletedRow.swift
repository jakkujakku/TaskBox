//
//  CompletedRow.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import SwiftUI

struct CompletedRow: View {
    var item: Completed

    var body: some View {
        HStack(alignment: .center) {
            Text(item.title)
                .font(.system(size: 30, weight: .bold))

            Spacer()
        }
    }
}

struct CompletedRow_Previews: PreviewProvider {
    static var previews: some View {
        let todo = Completed(title: "Hello World", insertDate: .now)
        CompletedRow(item: todo)
    }
}
