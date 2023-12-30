//
//  Layout.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct LayoutView<Content: View>: View {

    private var title: String
    private let content: () -> Content

    init(title: String, content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        BackgroundView {
            VStack(spacing: .zero) {
                ScrollView {
                    content()
                }

                Spacer()

                NavigationBarView()
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    LayoutView(title: "Test") {
        EmptyView()
    }
}
