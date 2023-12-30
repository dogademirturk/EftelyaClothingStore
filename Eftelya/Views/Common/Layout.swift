//
//  Layout.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct Layout: View {

    private var content: AnyView
    private var title: String

    init(content: AnyView, title: String) {
        self.content = content
        self.title = title
    }

    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            VStack(spacing: .zero) {
                ScrollView {
                    content
                }

                Spacer()

                NavigationBar()
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    Layout(content: AnyView(EmptyView()), title: "Test")
}
