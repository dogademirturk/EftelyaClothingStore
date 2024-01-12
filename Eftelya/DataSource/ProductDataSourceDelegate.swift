//
//  ProductDataSourceDelegate.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import Foundation

protocol ProductDataSourceDelegate: AnyObject {

    func productListLoaded(productList: [Product])

    func categoryListLoaded(categoryList: [Category])
}
