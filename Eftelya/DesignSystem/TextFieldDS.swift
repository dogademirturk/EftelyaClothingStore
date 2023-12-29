//
//  TextFieldDS.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct TextFieldDS: View {

    private let placeholder: String
    private let binding: Binding<String>

    init(placeholder: String, binding: Binding<String>) {
        self.placeholder = placeholder
        self.binding = binding
    }

    var body: some View {
        TextField(placeholder, text: binding)
            .padding(.vertical, Spacing.spacing_2)
            .padding(.horizontal, Spacing.spacing_3)
            //.background(.gray)
            //.cornerRadius(Radius.radius_2)
    }
}

#Preview {
    TextFieldDS(placeholder: "Test", binding: Binding.constant("Test"))
}
