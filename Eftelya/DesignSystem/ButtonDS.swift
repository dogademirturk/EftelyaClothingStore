//
//  ButtonDS.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct ButtonDS: View {

    private let title: String
    private let action: () -> Void

    init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(
            action: action
        ) {
            Text(title)
                .foregroundColor(.brown)
                .padding(.horizontal, Spacing.spacing_6)
                .padding(.vertical, Spacing.spacing_2)
                .overlay {
                    RoundedRectangle(cornerRadius: Radius.radius_4)
                        .stroke(.brown, lineWidth: 2)
                }
        }
        .padding(.vertical, Spacing.spacing_3)
    }
}

#Preview {
    ButtonDS(title: "Test") { }
}
