//
//  CompletedView.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import SwiftUI

struct CompletedView: View {
    @StateObject var viewModel = CompletedViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.completedList) { item in
                        CompletedRow(item: item)
                            .frame(height: 50)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Completed")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CompletedView()
}
