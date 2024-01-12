//
//  User.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 4.01.2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String

    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

// swiftlint:disable identifier_name
extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Deniz Yılmaz", email: "test@gmail.com")
}
// swiftlint:enable identifier_name
