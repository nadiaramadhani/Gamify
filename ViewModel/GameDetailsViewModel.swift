//
//  GameDetailsViewModel.swift
//  Catalogue MidProject
//
//  Created by Local Administrator on 10/10/22.
//

import Foundation
class GameDetailsViewModel: ObservableObject {
    @Published var error: Error?
    @Published var gameDetails: GameDetails = GameDetails(id: 0)
    let apiCaller = APICaller()
    
    
    func fetchGameDetails(id: Int) {
        apiCaller.getDetailGames(for: id) { status in
            switch status {
            case .success(let result):
                DispatchQueue.main.async {
                    self.gameDetails = result
                }
            case .failure(let error):
                self.error = error
            }
        }
    }
    
    
    
}
