//
//  TabViewDS.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 12.01.2024.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }

                UserInformationView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("My Account")
                    }

                AboutView()
                    .tabItem {
                        Image(systemName: "info")
                        Text("About Eftelya")
                    }
            }
            .toolbarBackground(Color.appBrown, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)

        }
}
}

#Preview {
    MainView()
}
