//
//  CharacterViewModels.swift
//  Assignment3
//
//  Created by Gabriella Seaman on 3/23/23.
//

import Foundation

class CharacterViewModel : ObservableObject {
    @Published private(set) var characterData = [CharacterModel]()
    @Published var hasError = false
    @Published var error : CharacterModelError?
    private let url = "https://rickandmortyapi.com/api/character"
    
    @MainActor
    func fetchCharacters() async {
        if let url = URL(string: url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedData = try JSONDecoder().decode(Response.self, from: data)
                self.characterData = decodedData.results.map { character in
                    CharacterModel(id: character.id, name: character.name, status: character.status, image: character.image)
                }
            } catch {
                self.hasError.toggle()
                self.error = CharacterModelError.customError(error: error)
            }
        }
    }
}


    extension CharacterViewModel {
        enum CharacterModelError : LocalizedError {
            case decodeError
            case customError(error: Error)
            
            var errorDescription: String? {
                switch self {
                case .decodeError:
                    return "Decoding Error"
                case .customError(let error):
                    return error.localizedDescription
                }
            }
            
        }

    }
