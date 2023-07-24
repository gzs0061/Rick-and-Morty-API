//
//  ImageCardView.swift
//  Assignment3
//
//  Created by Gabriella Seaman on 7/24/23.
//

import Foundation

import SwiftUI

struct ImageCardView: View {
    
    var image : String
    
    var body: some View {
        AsyncImage(url: URL(string: image)) { imageURL in
            imageURL.resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 150, height: 150)
        } placeholder: {
            ProgressView()
        }
        
    }
}

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardView(image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    }
}
