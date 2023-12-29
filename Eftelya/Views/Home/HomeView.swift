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
        VStack(spacing: .zero) {
            
            if viewModel.isLoading {
                Loading()
                    .onAppear {
                        viewModel.loadPlayerList()
                    }
            } else {
                List(viewModel.productList, id:\.self) { product in
                    ProductRow(product: product)
                }
            }

            Spacer()

            NavigationBar()
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
