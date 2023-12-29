//
//  ContentView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import SwiftUI

struct LoginView: View {

    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {

            VStack(spacing: .zero) {

                HStack(spacing: .zero) {

                    VStack(spacing: .zero) {
                        InputText(text: "Username")
                        InputText(text: "Password")
                    }
                    .padding(.horizontal, Spacing.spacing_3)

                    VStack(spacing: .zero) {
                        TextFieldDS(placeholder: "Username", binding: $viewModel.username)
                        TextFieldDS(placeholder: "Password", binding: $viewModel.password)
                    }
                    .padding(.horizontal, Spacing.spacing_3)
                }

                VStack(spacing: .zero) {
                    ButtonDS(title: "Log In") {
                        viewModel.logInTapped()
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

                    //TODO: delete
                    NavigationLink("Home", destination: HomeView())
                }
                .padding(Spacing.spacing_4)
            }
            .padding(Spacing.spacing_4)
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
