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
        Layout(content: mainContent as! AnyView, title: "Home")
    }

    private var mainContent: some View {
        VStack(spacing: .zero) {
            if viewModel.isLoading {
                Loading()
                    .onAppear {
                        viewModel.loadPlayerList()
                    }
                
            } else {
                
                ForEach(viewModel.productList, id: \.self) { product in
                    ProductRow(product: product)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
