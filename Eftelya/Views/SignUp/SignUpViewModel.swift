//
//  SignUpViewModel.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var showErrorAlert = false // State to control the error alert
}
