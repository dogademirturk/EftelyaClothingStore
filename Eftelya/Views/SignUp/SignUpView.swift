//
//  SignUpView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct SignUpView: View {

    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        BackgroundView {

            VStack(spacing: .zero) {

                Image(.logoWithoutText)
                    .resizable()
                    .frame(width: 175, height: 175)

                VStack(spacing: Spacing.spacing_4) {
                    InputField(text: $viewModel.email, title: "Email Addres", placeHolder: "name@example.com")
                        .autocapitalization(.none)

                    InputField(text: $viewModel.fullName, title: "Full Name", placeHolder: "Enter your name")

                    InputField(
                        text: $viewModel.password,
                        title: "Password",
                        placeHolder: "Enter your password",
                        isSecureField: true
                    )

                    ZStack(alignment: .trailing) {
                        InputField(
                            text: $viewModel.confirmPassword,
                            title: "Confirm Password",
                            placeHolder: "Confirm your password",
                            isSecureField: true
                        )
                        if !viewModel.password.isEmpty && !viewModel.confirmPassword.isEmpty {
                            if viewModel.password == viewModel.confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemRed))
                            }
                        }
                    }
                }
                .padding(.vertical, Spacing.spacing_2)

                ButtonDS(title: "Sign Up") {
                    Task {
                        do {
                            try await authViewModel.signUp(
                                withEmail: viewModel.email,
                                password: viewModel.password,
                                fullName: viewModel.fullName
                            )
                        } catch {
                            viewModel.showErrorAlert = true // Show the error alert when an error occurs during sign-up
                        }
                    }
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)

                Spacer()

                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Sign in")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
            .padding(Spacing.spacing_4)
            .navigationTitle("Sign Up")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .onTapGesture {
            // Dismiss the keyboard by resigning first responder
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .alert(item: $authViewModel.error) { _ in
                    Alert(
                        title: Text("Error"),
                        message: Text(authViewModel.error?.message ?? ""),
                        dismissButton: .default(Text("OK")) {
                            authViewModel.error = nil // Reset the error
                        }
                    )
        }
    }
}

// MARK: - AuthenticationFormProtocol
extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !viewModel.email.isEmpty && viewModel.email.contains("@") &&
        !viewModel.password.isEmpty && viewModel.password.count > 5 &&
        !viewModel.fullName.isEmpty && viewModel.confirmPassword == viewModel.password
    }
}

#Preview {
    SignUpView()
}
