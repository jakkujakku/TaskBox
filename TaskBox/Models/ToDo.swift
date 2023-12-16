//
//  ToDo.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import Foundation

struct ToDo: Identifiable, Hashable {
    var id: UUID
    var title: String
    var insertDate: Date
    
    init(id: UUID = UUID(), title: String, insertDate: Date) {
        self.id = id
        self.title = title
        self.insertDate = insertDate
    }
}
