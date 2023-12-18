//
//  Extensions.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import Foundation

struct Extensions {
    static let shared = Extensions()

    func dateFormatted(at date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일 aaa HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")

        let convertDate = dateFormatter.string(from: date)

        return convertDate
    }

    private init() {}
}
