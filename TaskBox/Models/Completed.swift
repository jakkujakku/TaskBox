//
//  Completed.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import Foundation

struct Completed: Identifiable {
    var id: UUID = .init()
    var title: String
    var insertDate: Date
}
