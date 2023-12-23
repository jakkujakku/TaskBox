//
//  DataManager.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import SwiftUI

class DataManager: ObservableObject {
    static let shared = DataManager()

    @Published var todoList: [ToDo] = []
    @Published var completedList: [Completed] = []

    // DataManager 내부에서 completedList를 업데이트하는 메서드 추가
    func updateCompletedList(_ newCompletedList: [Completed]) {
        self.completedList = newCompletedList
    }

    private init() {} // 외부에서 인스턴스화를 방지
}
