//
//  UserInformationRow.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 4.01.2024.
//

import SwiftUI

struct UserInformationRow: View {
    let imageName: String
    let title: String
    let tintColor: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)

            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    UserInformationRow(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
