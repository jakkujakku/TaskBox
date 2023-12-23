//
//  TabView.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/21/23.
//

import SwiftUI

struct SuperTabView: View {
    var body: some View {
        TabView {
            ToDoView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Task")
                }
                .tag(0)

            CompletedView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Completion")
                }
                .tag(1)
        }
        .tint(.red)
    }
}

struct SuperTabView_Previews: PreviewProvider {
    static var previews: some View {
        SuperTabView()
    }
}
