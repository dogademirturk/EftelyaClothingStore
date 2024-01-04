//
//  SignUpView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct SignUpView: View {

    //@StateObject private var viewModel = SignUpViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showErrorAlert = false // State to control the error alert

    var body: some View {
        /*BackgroundView {

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
                    viewModel.isRegisterActive = true
                }
                NavigationLink(
                    destination: LoginView(),
                    isActive: $viewModel.isRegisterActive
                ) {
                    EmptyView()
                }
            }
            .navigationTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
        }*/

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

                InputView(text: $fullName, title:"Full Name", placeHolder:"Enter your name")

                InputView(text: $password, title:"Password", placeHolder:"Enter your password", isSecureField: true)

                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword, title:"Confirm Password", placeHolder:"Confirm your password", isSecureField: true)
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
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
            .padding(.horizontal)
            .padding(.top, 12)

            //sign in button Aynısı DS yap--------------------------------------------------
            Button {
                Task {
                    do {
                        try await viewModel.signUp(withEmail: email, password: password, fullName: fullName)
                    } catch {
                        showErrorAlert = true // Show the error alert when an error occurs during sign-up
                    }
                }
            } label: {
                HStack {
                    Text("SIGN UP")
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

// MARK: - AuthenticationFormProtocol
extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5 && !fullName.isEmpty && confirmPassword == password
    }
}

#Preview {
    SignUpView()
}
