//
//  SignUpView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct SignUpView: View {

    @StateObject private var viewModel = SignUpViewModel()

    var body: some View {
        VStack(spacing: .zero) {

            Spacer()

            HStack(spacing: .zero) {
                
                VStack(spacing: .zero) {
                    InputText(text: "First Name")
                    InputText(text: "Last Name")
                    InputText(text: "Email")
                    InputText(text: "Username")
                    InputText(text: "Password")
                }
                .padding(.horizontal, Spacing.spacing_3)

                VStack(spacing: .zero) {
                    TextFieldDS(placeholder: "First Name", binding: $viewModel.firstName)
                    TextFieldDS(placeholder: "Last Name", binding: $viewModel.lastName)
                    TextFieldDS(placeholder: "Email", binding: $viewModel.email)
                    TextFieldDS(placeholder: "Username", binding: $viewModel.username)
                    TextFieldDS(placeholder: "Password", binding: $viewModel.password)
                }
                .padding(.horizontal, Spacing.spacing_3)
            }

            Spacer()

            ButtonDS(title: "Register") {

            }
        }
        .navigationTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SignUpView()
}
