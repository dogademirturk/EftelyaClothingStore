//
//  ProductDetailView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 4.01.2024.
//

import SwiftUI

struct ProductDetailView: View {

    private let product: Product

    init(product: Product) {
        self.product = product
    }

    var body: some View {
        VStack(spacing: .zero) {
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
            .padding(Spacing.spacing_5)

            VStack(alignment: .leading, spacing: .zero) {
                HStack(alignment: .top, spacing: .zero) {
                    InputText(text: "Title:")
                    InputText(text: product.title)
                }
                HStack(alignment: .top, spacing: .zero) {
                    InputText(text: "Price:")
                    InputText(text: "\(product.price)")
                }
                HStack(alignment: .top, spacing: .zero) {
                    InputText(text: "Category:")
                    InputText(text: product.category)
                }
                HStack(alignment: .top, spacing: .zero) {
                    InputText(text: "Description:")
                    InputText(text: product.description)
                }
            }
        }
    }
}

#Preview {
    ProductDetailView(product: Product(id: 0, title: "Test", price: 0.0, category: "Test", description: "Test", image: "Test"))
}
