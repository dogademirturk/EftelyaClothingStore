//
//  ProductDataSourceDelegate.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import Foundation

protocol ProductDataSourceDelegate {

    func productListLoaded(productList: [Product])
}
