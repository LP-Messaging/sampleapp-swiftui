//
//  PButton.swift
//  SampleApp
//
//  Created by Gorkem Karahan on 03.05.24.
//

import SwiftUI

let bgColor = Color(red: 219.0 / 255.0, green: 228.0 / 255.0, blue: 234.0 / 255.0)
let txtColor = Color(red: 34.0 / 255.0, green: 36.0 / 255.0, blue: 44.0 / 255.0)

struct PButton: View {
    var title: String
    var action: () -> Void

    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(title) {
            action()
        }
        .foregroundColor(txtColor)
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        .background(bgColor)
        .cornerRadius(16)
    }
}
