//
//  GameDetailModel.swift
//  Catalogue MidProject
//
//  Created by Local Administrator on 10/10/22.
//

import Foundation
import SwiftUI

struct GameDetails: Codable {
    var id: Int
    var name: String?
    var released: String?
    var backgroundImage: String?
    var website: String?
    var rating: Double?
    var description: String?
    var descriptionRaw: String?
}

enum CodingKeys: String, CodingKey {
    case id, name, released
    case backgroundImage = "background_image"
    case website, rating
    case description
    case descriptionRaw = "description_raw"
}

extension GameDetails {
    static var example: GameDetails {
        GameDetails(id: 1, name: "", released: "", backgroundImage: "", website: "", rating: 0.0, description: "", descriptionRaw: "")
    }
}
