//
//  AboutView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: .zero) {
            VStack(spacing: .zero) {
                
                Spacer()

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet velit vel tellus euismod aliquet. Nullam tincidunt aliquet velit, a vulputate lacus volutpat eu. Praesent non orci eu dui tristique ultrices. Suspendisse luctus, eros id bibendum tristique, dolor dolor dapibus metus, et aliquam elit augue a quam. Integer sit amet justo sit amet dolor fringilla scelerisque. Morbi elementum euismod justo, in fermentum ligula. Vivamus lacinia, sem sit amet tincidunt tincidunt, purus turpis dictum justo, vel fringilla urna mauris a augue.")
                    .padding(Spacing.spacing_5)

                Spacer()

                NavigationBar()
            }
        }
        .navigationTitle("About Eftelya")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AboutView()
}
