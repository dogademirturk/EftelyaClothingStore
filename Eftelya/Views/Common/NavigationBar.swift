//
//  NavigationBar.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct NavigationBar: View {

    var body: some View {
        HStack(spacing: .zero) {
            Rectangle()
                .foregroundColor(.brown)
                .frame(height: 75)
                .overlay {
                    HStack {
                        NavigationLink("Home", destination: HomeView())
                            .foregroundColor(.black)
                            .padding(.horizontal, Spacing.spacing_5)
                        NavigationLink("My Account", destination: EmptyView())
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
    NavigationBar()
}
