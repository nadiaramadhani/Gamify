//
//  GamesDetailView.swift
//  Catalogue MidProject
//
//  Created by Local Administrator on 05/10/22.
//

import SwiftUI

struct GamesDetailView: View {
    var gameId: Int
    let games: Game
    @EnvironmentObject var favorites: Favorites
    @StateObject var gameDetailViewModel = GameDetailsViewModel()
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: "\(games.backgroundImage)")) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 350)
                } else {
                    ProgressView {
                        Label("Fetching image", systemImage: "photo.fill")
                    }
                    .frame(width: 400, height: 350)
                        
                }
            }
      //  ScrollView{
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.red)
                VStack(alignment: .leading) {
                    Button(favorites.contains(games) ? "Remove from favorites" : "Add to favorites") {
                        if favorites.contains(games) {
                            favorites.remove(games)
                        } else {
                            favorites.add(games)
                            favorites.save()
                        }
                    }
                    .padding()
                    Text("Released: \(games.released)")
                    Text("\(String(games.playtime)) time played")
                    Text(String(games.rating))
                    Text(gameDetailViewModel.gameDetails.description ?? "Desc")
                    Link("Open url", destination: (URL(string: "\(gameDetailViewModel.gameDetails.website ?? "http://thecrew-game.com" )")!))
                    
                }
                .frame(width: 350)
            }
        //}
               }
        .scrollIndicators(.hidden)
        .onAppear{
            gameDetailViewModel.fetchGameDetails(id: gameId)
        }
    }
}

////
//struct GamesDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}
