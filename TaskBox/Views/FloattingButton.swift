//
//  FloattingButton.swift
//  TaskBox
//
//  Created by 준우의 MacBook 16 on 12/16/23.
//

import SwiftUI

struct FloattingButton: View {
    var body: some View {
        Image(systemName: "plus")
            .font(.title.weight(.semibold))
            .padding()
            .background(Color.pink)
            .foregroundColor(.white)
            .clipShape(Circle())
            .shadow(radius: 4, x: 0, y: 4)
    }
}

#Preview {
    FloattingButton()
}
