//
//  ProductDataSource.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import Foundation

struct ProductDataSource {

    private let baseURL = "https://fakestoreapi.com"
    weak var delegate: ProductDataSourceDelegate?

    func loadProductList() {

        let session = URLSession.shared

        guard let url = URL(string: "\(baseURL)/products") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let dataTask = session.dataTask(with: request) { data, _, error in
            guard let data else { return }
            let decoder = JSONDecoder()
            do {
                let productList = try decoder.decode([Product].self, from: data)
                DispatchQueue.main.async {
                    delegate?.productListLoaded(productList: productList)
                }
            } catch {
                print(error)
            }
        }

        dataTask.resume()
    }

    func loadCategoryList() {

        let session = URLSession.shared

        guard let url = URL(string: "\(baseURL)/products/categories") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let dataTask = session.dataTask(with: request) { data, _, error in
            guard let data else { return }
            let decoder = JSONDecoder()
            do {
                let categories = try decoder.decode([String].self, from: data)
                let categoryObjects = categories.map { Category(name: $0) }
                DispatchQueue.main.async {
                    delegate?.categoryListLoaded(categoryList: categoryObjects)
                }
            } catch {
                print(error)
            }
        }

        dataTask.resume()
    }
}
