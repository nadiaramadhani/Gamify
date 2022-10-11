//
//  ContentView.swift
//  Catalogue MidProject
//
//  Created by Local Administrator on 05/10/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gamesViewModel = GamesViewModel()
    @ObservedObject var detailsViewModel = GameDetailsViewModel()
    @StateObject var favorites = Favorites()
    @State var searchText: String = ""
    
    var searchedGame: [Game] {
        if searchText.count == 0 {
            return gamesViewModel.games
        } else {
            return gamesViewModel.games.filter{$0.name.lowercased().contains(searchText.lowercased())}
        }
    }
    var body: some View {
        
        NavigationView {
            List(searchedGame) { game in
                NavigationLink{
                    GamesDetailView(gameId: game.id, games: game)
                }label: {
                    HStack {
                        AsyncImage(url: URL(string: "\(game.backgroundImage)")) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100, alignment: .leading)
                            } else {
                                ProgressView()
                                    .frame(width: 100, height: 100, alignment: .center)
                                
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(game.name)
                                .bold()
                            HStack{
                                VStack(alignment: .leading){
                                    Text(game.released)
                                    Text(String(game.rating))
                                }
                                Spacer()
                                if favorites.contains(game){
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                        .font(.system(size: 35))
                                        
                                    
                                }
                                
                            }
                        }
                    }
                }
                .navigationTitle("Games")
                
            }.listStyle(.plain)
                
            .searchable(text: $searchText, prompt: "Search game")
            .onAppear{
                gamesViewModel.fetchGames()
            }
        }
        
        .environmentObject(favorites)

        
        
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(, games: <#[Result]#>)
//    }
//}
