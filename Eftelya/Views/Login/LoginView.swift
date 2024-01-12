//
//  ContentView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct LoginView: View {

    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Color.main
                    .ignoresSafeArea()

                VStack(spacing: .zero) {

                    Image(.logo)
                        .resizable()
                        .frame(width: 300, height: 300)

                    VStack(spacing: Spacing.spacing_4) {
                        InputField(text: $viewModel.email, title: "Email", placeHolder: "name@example.com")
                            .autocapitalization(.none)

                        InputField(
                            text: $viewModel.password,
                            title: "Password",
                            placeHolder: "Enter your password",
                            isSecureField: true
                        )
                    }
                    .padding(.vertical, Spacing.spacing_2)

                    ButtonDS(title: "Sign In") {
                        Task {
                            do {
                                try await authViewModel.signIn(withEmail: viewModel.email, password: viewModel.password)
                            } catch {
                                viewModel.showErrorAlert = true
                            }
                        }
                    }
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)

                    Spacer()

                    NavigationLink {
                        SignUpView()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                            Text("Sign up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    }
                }
                .padding(Spacing.spacing_4)
                .navigationTitle("Login")
                .navigationBarHidden(true)
            }
            .onTapGesture {
                // Dismiss the keyboard by resigning first responder
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
                )
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
}

// MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !viewModel.email.isEmpty && viewModel.email.contains("@") &&
                !viewModel.password.isEmpty && viewModel.password.count > 5
    }
}

#Preview {
    LoginView()
}
