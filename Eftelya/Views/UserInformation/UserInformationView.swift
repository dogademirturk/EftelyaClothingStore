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
        NavigationView {
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

                    Section("Account") {
                        Button {
                            authViewModel.signOut()
                        } label: {
                            UserInformationRow(
                                imageName: "arrow.left.circle.fill",
                                title: "Sign Out",
                                tintColor: .yellow
                            )
                        }

                        Button {
                            Task {
                                try await authViewModel.deleteAccount()
                            }
                        } label: {
                            UserInformationRow(
                                imageName: "xmark.circle.fill",
                                title: "Delete Account",
                                tintColor: .red
                            )
                        }
                    }
                }
                .background(Color.main)
                .scrollContentBackground(.hidden)
                .navigationTitle("My Account")
                .toolbarBackground(Color.appBrown, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
            }

        }
    }
}

#Preview {
    UserInformationView()
}
