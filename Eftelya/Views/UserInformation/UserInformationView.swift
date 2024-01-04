//
//  UserInformationView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct UserInformationView: View {

    //@StateObject private var viewModel = UserInformationViewModel()
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        /*LayoutView(title: "My Account") {
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
        }*/

        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)

                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }

                Section("ACCOUNT") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        UserInformationRow(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }

                    Button {
                        Task {
                            try await viewModel.deleteAccount()
                        }
                    } label: {
                        UserInformationRow(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                }
            }
        }
    }
}

#Preview {
    UserInformationView()
}
