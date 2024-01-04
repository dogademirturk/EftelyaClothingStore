//
//  LoginViewModel.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showErrorAlert = false // State to control the error
}
