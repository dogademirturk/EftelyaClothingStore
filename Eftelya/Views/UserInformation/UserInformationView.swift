//
//  UserInformationView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct UserInformationView: View {

    @StateObject private var viewModel = UserInformationViewModel()

    var body: some View {
        VStack(spacing: .zero) {

            Spacer()

            HStack(spacing: .zero) {

                VStack(spacing: .zero) {
                    InputText(text: "First Name")
                    InputText(text: "Last Name")
                    InputText(text: "Email")
                    InputText(text: "Username")
                }
                .padding(.horizontal, Spacing.spacing_3)

                VStack(spacing: .zero) {
                    InputText(text: "<First Name>")
                    InputText(text: "<Last Name>")
                    InputText(text: "<Email>")
                    InputText(text: "<Username>")
                }
                .padding(.horizontal, Spacing.spacing_3)
            }

            Spacer()

            ButtonDS(title: "Log Out") {
                viewModel.isLogOutActive = true
            }
            NavigationLink(
                destination: LoginView(),
                isActive: $viewModel.isLogOutActive
            ) {
                EmptyView()
            }

            NavigationBar()
        }
        .navigationTitle("My Account")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    UserInformationView()
}
