//
//  InputText.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct InputText: View {

    private var text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .padding(.vertical, Spacing.spacing_2)
            .padding(.horizontal, Spacing.spacing_3)
            .foregroundColor(.black)
    }
}

#Preview {
    InputText(text: "Test")
}
