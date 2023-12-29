//
//  SignUpViewModel.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 29.12.2023.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
}
