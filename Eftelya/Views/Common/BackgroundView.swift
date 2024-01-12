//
//  BackgroundView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct BackgroundView<Content: View>: View {

    private let content: () -> Content

    init(content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()

            content()
        }
    }
}

#Preview {
    BackgroundView {
        EmptyView()
    }
}
