//
//  HomeView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()

            VStack(spacing: .zero) {

                if viewModel.isLoading {
                    Spacer()

                    Loading()
                        .onAppear {
                            viewModel.loadPlayerList()
                        }

                } else {

                    ScrollView {
                        VStack(spacing: .zero) {
                            ForEach(viewModel.productList, id: \.self) { product in
                                ProductRow(product: product)
                            }
                        }
                    }
                }

                Spacer()

                NavigationBar()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    HomeView()
}
