//
//  ProfileView.swift
//  Catalogue MidProject
//
//  Created by Local Administrator on 05/10/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Image("banner")
                .resizable()
                .frame(width: 375, height: 120)
            Image("profile")
                .resizable()
                .frame(width: 300, height: 300)
            Text("Name: Nadia Ramadhani")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
