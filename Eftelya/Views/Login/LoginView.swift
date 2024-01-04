//
//  ContentView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct LoginView: View {

    //@StateObject private var viewModel = LoginViewModel()
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showErrorAlert = false // State to control the error

    var body: some View {
        /*NavigationStack {
            BackgroundView {

                VStack(spacing: .zero) {

                    Image(.logo)
                        .resizable()
                        .frame(width: 300, height: 300)

                    HStack(spacing: .zero) {

                        VStack(alignment: .leading, spacing: .zero) {
                            InputText(text: "Username")
                            InputText(text: "Password")
                        }

                        VStack(alignment: .leading, spacing: .zero) {
                            TextFieldDS(placeholder: "Username", binding: $viewModel.username)
                            TextFieldDS(placeholder: "Password", binding: $viewModel.password)
                        }
                    }

                    VStack(spacing: .zero) {
                        ButtonDS(title: "Log In") {
                            viewModel.isLogInActive = true
                        }
                        NavigationLink(
                            destination: HomeView(),
                            isActive: $viewModel.isLogInActive
                        ) {
                            EmptyView()
                        }

                        ButtonDS(title: "Sign Up") {
                            viewModel.isSignUpActive = true
                        }
                        NavigationLink(
                            destination: SignUpView(),
                            isActive: $viewModel.isSignUpActive
                        ) {
                            EmptyView()
                        }
                    }
                    .padding(Spacing.spacing_4)
                }
                .padding(Spacing.spacing_4)
                .navigationTitle("Login")
                .navigationBarHidden(true)
            }
        }*/

        NavigationStack {
            VStack {
                Image(.logo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical,32)

                //form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title:"Email Addres", placeHolder:"name@example.com")
                        .autocapitalization(.none)

                    InputView(text: $password, title:"Password", placeHolder:"Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)

                //sign in button
                Button {
                    Task {
                        do {
                            try await viewModel.signIn(withEmail: email, password: password)
                        } catch {
                            showErrorAlert = true // Show the error alert when an error occurs during sign-up
                        }
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)

                Spacer()

                //sign up button

                NavigationLink {
                    SignUpView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
            .alert(item: $viewModel.error) { error in
                        Alert(
                            title: Text("Error"),
                            message: Text(viewModel.error?.message ?? ""),
                            dismissButton: .default(Text("OK")) {
                                viewModel.error = nil // Reset the error
                            }
                        )
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}

#Preview {
    LoginView()
}
