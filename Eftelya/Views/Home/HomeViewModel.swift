//
//  HomeViewModel.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var productList: [Product] = []
    @Published var categoryList: [Category] = []
    @Published var isSheetPresented = false
    @Published var selectedProduct: Product?
    @Published var selectedCategory: Category?

    private var dataSource = ProductDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadProductList() {
        dataSource.loadProductList()
    }

    func loadCategoryList() {
        dataSource.loadCategoryList()
    }

    func productTapped(product: Product) {
        selectedProduct = product
        isSheetPresented = true
    }

    var filteredProductList: [Product] {
          guard let selectedCategory = selectedCategory else {
              return productList // Return the original list when no category is selected
          }
          return productList.filter { $0.category == selectedCategory.name }
      }
}

extension HomeViewModel: ProductDataSourceDelegate {

    func productListLoaded(productList: [Product]) {
        self.productList = productList
        isLoading = false
    }

    func categoryListLoaded(categoryList: [Category]) {
        self.categoryList = categoryList
    }
}
