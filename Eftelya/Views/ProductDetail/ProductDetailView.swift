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
                    HStack(alignment: .top, spacing: Spacing.spacing_3) {
                        MainText(text: "Title:")
                        MainText(text: product.title)
                    }
                }

                Section {
                    HStack(alignment: .top, spacing: Spacing.spacing_3) {
                        MainText(text: "Price:")
                        MainText(text: "\(product.price)")
                    }
                }

                Section {
                    HStack(alignment: .top, spacing: Spacing.spacing_3) {
                        MainText(text: "Category:")
                        MainText(text: product.category)
                    }
                }

                Section {
                    HStack(alignment: .top, spacing: Spacing.spacing_3) {
                        MainText(text: "Description:")
                        MainText(text: product.description)
                    }
                }
            }
        }
    }
}

#Preview {
    ProductDetailView(product: Product(id: 0, title: "Test", price: 0.0, category: "Test", description: "Test", image: "Test"))
}
