//
//  Favorites.swift
//  Catalogue MidProject
//
//  Created by Local Administrator on 07/10/22.
//
//
//import Foundation
//
//class Favorites: ObservableObject {
//    private var favGames: Set<String>
//    private let saveKey = "Favorites"
//    let defaults = UserDefaults.standard
//
//    init(){
//        let decoder = JSONDecoder()
//        if let data = defaults.value(forKey: "Favorites") as? Data {
//            let taskdata = try? decoder.decode(Set<String>.self, from: data)
//            self.favGames = taskdata ?? []
//        }
//        else {
//            self.favGames = []
//        }
//
//    }
//
//    func getId() -> Set<String>{
//        return self.favGames
//    }
//    func isEmpty() -> Bool {
//        favGames.count < 1
//    }
//    func contains(_ favGame: Game) -> Bool {
//        favGames.contains(String(favGame.id))
//    }
//    func add(_ favGame: Game) {
//        objectWillChange.send()
//        favGames.insert(String(favGame.id))
//    }
//    func save() {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(Favorites) {
//            defaults.set(encoded, forKey: "Favorites")
//        }
//    }
//
//
//}


//MARK: PAUL
import Foundation
class Favorites: ObservableObject {
    private var favGames: Set<Int>
    private let saveKey = "Favorites"
    @Published var game: [Game]
    init() {
        
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "Favorites") as? Data {
            let decoded = try? decoder.decode(Set<Int>.self, from: data)
            self.favGames = decoded ?? []
            
        }
        favGames = []
        game = []
    }
    
    func contains(_ favGame: Game) -> Bool {
        favGames.contains(favGame.id)
    }
    
    func add(_ favGame: Game) {
        objectWillChange.send()
        favGames.insert(favGame.id)
        save()
    }
    func save() {
        if let encoded = try? JSONEncoder().encode(favGames) {
            UserDefaults.standard.set(encoded, forKey: "Favorites")
        }
    }
    func remove(_ favGame: Game) {
        objectWillChange.send()
        favGames.remove(favGame.id)
        
    }
}
