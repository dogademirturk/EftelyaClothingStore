//
//  InputText.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct MainText: View {

    private var text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .padding(.vertical, Spacing.spacing_2)
            .foregroundColor(.black)
    }
}

#Preview {
    MainText(text: "Test")
}
