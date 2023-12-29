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

    private var dataSource = ProductDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadPlayerList() {
        dataSource.loadProductList()
    }
}

extension HomeViewModel: ProductDataSourceDelegate {

    func productListLoaded(productList: [Product]) {
        self.productList = productList
        isLoading = false
    }
}
