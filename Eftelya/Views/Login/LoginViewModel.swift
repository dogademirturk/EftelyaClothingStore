//
//  LoginViewModel.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isSignUpActive = false
    @Published var isLogInActive = false

    func logInTapped() {
        print(username)
        print(password)
    }
}
