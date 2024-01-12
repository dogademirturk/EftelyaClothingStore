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
        ZStack {
            Color.main
                .ignoresSafeArea()

            VStack(spacing: .zero) {
                List {
                    Section {
                        AsyncImage(url: URL(string: product.image)) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300)
                            default:
                                Loading()
                            }
                        }
                        .padding(Spacing.spacing_5)
                    }

                    Section {
                        MainText(text: product.title)
                        MainText(text: String(format: "$ %.2f", product.price))
                    }

                    .listRowSeparator(.hidden)

                    Section {
                        MainText(text: product.category)
                    } header: {
                        Text("Category")
                    }

                    Section {
                        MainText(text: product.description)
                    } header: {
                        Text("Description")
                    }
                }
            }
        }
    }
}

#Preview {
    ProductDetailView(product: Product(
        id: 0,
        title: "Test",
        price: 0.0,
        category: "Test",
        description: "Test",
        image: "Test"
    ))
}
