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
        
        NavigationStack {
            LayoutView(title: "Home") {
                VStack(spacing: .zero) {
                    
                    if viewModel.isLoading {
                        Loading()
                            .onAppear {
                                viewModel.loadPlayerList()
                            }
                        
                    } else {
                        
                        ForEach(viewModel.productList, id: \.self) { product in
                            ProductRow(product: product)
                                .onTapGesture {
                                    viewModel.productTapped(product: product)
                                }
                        }
                    }
                }
            }
            .sheet(
                isPresented: $viewModel.isSheetPresented,
                content: {
                    ProductDetailView(product: viewModel.selectedProduct ?? Product(id: 0, title: "Test", price: 0.0, category: "Test", description: "Test", image: "Test"))
                }
            )
        }
    }
}

#Preview {
    HomeView()
}
