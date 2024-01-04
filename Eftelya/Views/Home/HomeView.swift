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
            BackgroundView {
                VStack(spacing: .zero) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 1) {
                            ForEach(viewModel.categoryList) { category in
                                Button(action: {
                                    if viewModel.selectedCategory == category {
                                        viewModel.selectedCategory = nil // Deselect the category
                                    } else {
                                        viewModel.selectedCategory = category // Select the category
                                    }

                                }) {
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
                                    HStack(spacing: .zero) {
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

                                        Spacer()

                                        VStack(spacing: .zero) {
                                            Text(product.title)
                                            Text("\(product.price)")
                                        }
                                    }
                                }
                                .onTapGesture {
                                    viewModel.productTapped(product: product)
                                }
                            }
                            .scrollContentBackground(.hidden)
                        }
                    }

                    Spacer()

                    NavigationBarView()
                }
                .navigationTitle("Home")
                .toolbarBackground(Color.appBrown, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .ignoresSafeArea(edges: .bottom)
                .sheet(
                    isPresented: $viewModel.isSheetPresented,
                    content: {
                        ProductDetailView(product: viewModel.selectedProduct ?? Product(id: 0, title: "Test", price: 0.0, category: "Test", description: "Test", image: "Test"))
                    }
                )
            }
        }
    }
}

#Preview {
    HomeView()
}
