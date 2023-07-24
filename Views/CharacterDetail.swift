//
//  CharacterDetail.swift
//  Assignment3
//
//  Created by Gabriella Seaman on 3/24/23.
//

import SwiftUI

struct CharacterDetail: View {
    var character: CharacterModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(character.name)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                Text(character.status)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                ImageCardView(image: character.image)
                        
                    }
                }
            }
        }

    

