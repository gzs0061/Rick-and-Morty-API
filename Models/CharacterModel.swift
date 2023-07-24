//
//  CharacterModel.swift
//  Assignment3
//
//  Created by Gabriella Seaman on 3/23/23.
//

import Foundation

struct CharacterModel: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let image: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, name, status, image
    }
}

struct Response: Codable {
    let results: [CharacterModel]
}
