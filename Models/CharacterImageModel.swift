//
//  CharacterImageModel.swift
//  Assignment3
//
//  Created by Gabriella Seaman on 3/25/23.
//

import Foundation

struct CharacterImageModel : Codable, Identifiable {
    var id: ObjectIdentifier
    
    let credit : String
    let title : String
    let altText : String
    let caption : String
    let url : String
}
