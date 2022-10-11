//
//  APICaller.swift
//  Catalogue MidProject
//
//  Created by Local Administrator on 05/10/22.
//

import Foundation

struct Constans {
    static let baseURL = "https://api.rawg.io/api"
    static let apiKey = "21885b6d87034756a256e6773a07ec2f"
}


class APICaller {
    func getGames( completion: @escaping (Result<GamesResponse, Error>) -> Void) {
        
        guard let url = URL(string: "\(Constans.baseURL)/games?key=\(Constans.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error ==  nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(GamesResponse.self, from: data)
                completion(.success(result))
            } catch{
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    func getDetailGames(for id: Int, completion: @escaping (Result<GameDetails, Error>) -> Void) {
        guard let url = URL(string: "\(Constans.baseURL)/games/\(id)?key=\(Constans.apiKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(GameDetails.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
                print(error)
            }
            
        }
        task.resume()
        
        
    }
}

