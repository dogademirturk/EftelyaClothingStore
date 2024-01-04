//
//  NavigationBar.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct NavigationBarView: View {

    var body: some View {
        HStack(spacing: .zero) {
            Rectangle()
                .foregroundColor(.appBrown)
                .frame(height: 110)
                .overlay {
                    HStack {
                        NavigationLink("Home", destination: HomeView())
                            .foregroundColor(.black)
                            .padding(.horizontal, Spacing.spacing_5)

                        Spacer()

                        NavigationLink("My Account", destination: UserInformationView())
                            .foregroundColor(.black)
                            .padding(.horizontal, Spacing.spacing_5)

                        Spacer()

                        NavigationLink("About Eftelya", destination: AboutView())
                            .foregroundColor(.black)
                            .padding(.horizontal, Spacing.spacing_5)
                    }
                }
        }
    }
}

#Preview {
    NavigationBarView()
}
