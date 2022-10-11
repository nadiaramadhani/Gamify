//
//  GamesViewModel.swift
//  Catalogue MidProject
//
//  Created by Local Administrator on 10/10/22.
//

import Foundation
class GamesViewModel: ObservableObject {
    @Published var error: Error?
    @Published var games: [Game] = []
    
    let apiCall = APICaller()
    
    func fetchGames() {
        
        apiCall.getGames { status  in
            switch status {
            case .success(let result):
                DispatchQueue.main.async {
                    if let games = result.results {
                        self.games = games
                    }
                }
            case .failure(let error):
                self.error = error

            }
            
        }
    }
    
}
