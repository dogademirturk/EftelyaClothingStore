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
        LayoutView(title: "My Account") {
            VStack(spacing: .zero) {

                Spacer()

                HStack(spacing: .zero) {

                    VStack(alignment: .leading, spacing: .zero) {
                        InputText(text: "First Name")
                        InputText(text: "Last Name")
                        InputText(text: "Email")
                        InputText(text: "Username")
                    }

                    VStack(alignment: .leading, spacing: .zero) {
                        InputText(text: "<First Name>")
                        InputText(text: "<Last Name>")
                        InputText(text: "<Email>")
                        InputText(text: "<Username>")
                    }
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
            }
        }
    }
}

#Preview {
    UserInformationView()
}
