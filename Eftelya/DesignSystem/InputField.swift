//
//  InputView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 4.01.2024.
//

import SwiftUI

struct InputField: View {
    @Binding var text: String
    let title: String
    let placeHolder: String
    var isSecureField = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)

            if isSecureField {
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 14))
                    .preferredColorScheme(.light)
            } else {
                TextField(placeHolder, text: $text)
                    .font(.system(size: 14))
                    .preferredColorScheme(.light)
            }

            Divider()

        }
    }
}

#Preview {
    InputField(text: .constant(""), title: "Email Addres", placeHolder: "name@example.com")
}
