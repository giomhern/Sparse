//
//  TabBarView.swift
//  socially
//
//  Created by Giovanni Maya on 3/3/24.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
