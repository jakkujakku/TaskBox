//
//  CompletedViewModel.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import Foundation

class CompletedViewModel: ObservableObject {
    @Published var completedList: [Completed]

    init() {
        self.completedList = DataManager.shared.completedList

        // DataManager의 completedList 변경을 감지하여 뷰 모델 업데이트
        DataManager.shared.$completedList
            .assign(to: &$completedList)
    }
}
