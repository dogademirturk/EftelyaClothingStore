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
    @Published var isSheetPresented = false
    @Published var selectedProduct: Product?

    private var dataSource = ProductDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadProductList() {
        dataSource.loadProductList()
    }

    func productTapped(product: Product) {
        selectedProduct = product
        isSheetPresented = true
    }
}

extension HomeViewModel: ProductDataSourceDelegate {

    func productListLoaded(productList: [Product]) {
        self.productList = productList
        isLoading = false
    }
}
