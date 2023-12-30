//
//  ProductRow.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct ProductRow: View {

    private let product: Product

    init(product: Product) {
        self.product = product
    }

    var body: some View {
        ZStack {
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

                Spacer()

                VStack(spacing: .zero) {
                    Text(product.title)
                    Text("\(product.price)")
                }
            }
            .padding(Spacing.spacing_6)
            .background(
                RoundedRectangle(cornerRadius: Radius.radius_4)
                    .foregroundColor(.white)
            )
        }
        .padding(Spacing.spacing_3)
    }
}

#Preview {
    ProductRow(product: Product(id: 1, title: "Test", price: 0.0, category: "Test", description: "Test", image: "Test"))
}
