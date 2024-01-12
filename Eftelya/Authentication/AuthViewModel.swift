//
//  AuthViewModel.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 4.01.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var error: AuthenticationError?

    enum AuthenticationError: Error, Identifiable {
            case emailAlreadyInUse(message: String)
            case weakPassword(message: String)
            case unknownError(message: String)
            case invalidEmail(message: String)

            var message: String {
                switch self {
                case .emailAlreadyInUse(let message),
                        .weakPassword(let message),
                        .unknownError(let message),
                        .invalidEmail(let message):
                    return message
                }
            }

            var id: String {
                message
            }
        }

    init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
    }

    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch _ {
            self.error = .unknownError(
                message: "There was an issue with logging in. Please check your credentials and try again. " +
                "If the problem persists, please try again later."
            )
        }
    }

    func signUp(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch let error as NSError {

            switch error.code {

            case AuthErrorCode.emailAlreadyInUse.rawValue:
                self.error = .emailAlreadyInUse(message: "The email is already in use.")
            case AuthErrorCode.weakPassword.rawValue:
                self.error = .weakPassword(message: "The password is too weak.")
            case AuthErrorCode.invalidEmail.rawValue:
                self.error = .invalidEmail(message: "The email address is badly formatted.")
            default:
                self.error = .unknownError(message: "An unknown error occurred.")
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil // wipes out user session and takes us back to login screen
            self.currentUser = nil // wipes out current user data model
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }

    func deleteAccount() async {
        guard let currentUser = Auth.auth().currentUser else { return }
            do {
                // Delete user data from Firestore
                let userDocument = Firestore.firestore().collection("users").document(currentUser.uid)
                try await userDocument.delete()

                // Delete user from Firebase Authentication
                try await currentUser.delete()

                // Clear local session and user data
                self.userSession = nil
                self.currentUser = nil
            } catch {
                print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
            }
    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore
            .firestore()
            .collection("users")
            .document(uid)
            .getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
