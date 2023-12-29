//
//  Product.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import Foundation

struct Product: Codable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let category: String
    let description: String
    let image: String
}
