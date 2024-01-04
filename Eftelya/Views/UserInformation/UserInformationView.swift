//
//  UserInformationView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct UserInformationView: View {

    @StateObject private var viewModel = UserInformationViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        /*LayoutView(title: "My Account") {
            VStack(spacing: .zero) {
                //if let user = authViewModel.currentUser {
                    /*HStack(spacing: .zero) {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                            .padding(.horizontal, Spacing.spacing_3)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)

                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }*/

                    Spacer()

                    ButtonDS(title: "Sign Out") {
                        authViewModel.signOut()
                    }

                    ButtonDS(title: "Delete Account") {
                        Task {
                            try await authViewModel.deleteAccount()
                        }
                    }
                }
                /*Spacer()

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
                }*/
            //}
        }*/

        if let user = authViewModel.currentUser {
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
                        authViewModel.signOut()
                    } label: {
                        UserInformationRow(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }

                    Button {
                        Task {
                            try await authViewModel.deleteAccount()
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
