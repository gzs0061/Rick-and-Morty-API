//
//  Characters.swift
//  Assignment3
//
//  Created by Gabriella Seaman on 3/23/23.
//

import SwiftUI

struct Characters: View {
    @ObservedObject var Charactersvm = CharacterViewModel()
       
    var body: some View {
        NavigationView {
            List {
                ForEach(Charactersvm.characterData) { Character in
                    NavigationLink {
                        CharacterDetail(character: Character)
                    } label: {
                        Text(Character.name)
                    }
                }
            }
            .task {
                await Charactersvm.fetchCharacters()
            }
            .listStyle(.grouped)
            .navigationBarTitle("Characters")
            .alert(isPresented: $Charactersvm.hasError, error: Charactersvm.error) {
                if let error = Charactersvm.error {
                    Text("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

   struct ContentView_Previews: PreviewProvider {
       static var previews: some View {
           Characters()
       }
   }
