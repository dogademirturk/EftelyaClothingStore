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
        NavigationView {
            VStack(spacing: .zero) {

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 1) {
                        ForEach(viewModel.categoryList) { category in
                            Button {
                                if viewModel.selectedCategory == category {
                                    viewModel.selectedCategory = nil // Deselect the category
                                } else {
                                    viewModel.selectedCategory = category // Select the category
                                }
                            } label: {
                                Text(category.name)
                                    .padding()
                                    .background(viewModel.selectedCategory == category ?Color.green : Color.cyan)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal, Spacing.spacing_1)
                        }
                    }
                    .padding()
                }
                .frame(height: 80)
                .background(Color.gray.opacity(0.1)) // Add a background color for category section
                .onAppear {
                    viewModel.loadCategoryList()
                }

                VStack(spacing: .zero) {
                    if viewModel.isLoading {
                        Spacer()

                        Loading()
                            .onAppear {
                                viewModel.loadProductList()
                            }

                        Spacer()

                    } else {
                        List(viewModel.filteredProductList, id: \.self) { product in
                            Section {
                                HStack(spacing: Spacing.spacing_5) {
                                    AsyncImage(url: URL(string: product.image)) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                        default:
                                            Loading()
                                        }
                                    }
                                    .padding(.vertical, Spacing.spacing_3)

                                    VStack(spacing: .zero) {
                                        MainText(text: product.title)
                                        MainText(text: String(format: "$ %.2f", product.price))
                                    }
                                }
                            }
                            .onTapGesture {
                                viewModel.productTapped(product: product)
                            }
                        }
                        .background(Color.main)
                        .scrollContentBackground(.hidden)
                    }
                }
            }
            .navigationTitle("Home")
            .toolbarBackground(Color.appBrown, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .sheet(
                isPresented: $viewModel.isSheetPresented,
                content: {
                    ProductDetailView(
                        product:
                            viewModel.selectedProduct ??
                            Product(
                                id: 0,
                                title: "Test",
                                price: 0.0,
                                category: "Test",
                                description: "Test",
                                image: "Test"
                            ))
                }
            )
        }
    }
}

#Preview {
    HomeView()
}
