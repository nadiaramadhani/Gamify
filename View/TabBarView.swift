//
//  TabBarView.swift
//  Catalogue MidProject
//
//  Created by Local Administrator on 05/10/22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            ContentView()
                .tag(1)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            ProfileView()
                .tag(2)
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
