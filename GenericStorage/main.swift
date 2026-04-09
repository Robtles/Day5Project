//
//  main.swift
//  GenericStorage
//

import Foundation

let storage = LocalStorageImpl()

// Test d'usage
let pokemon = storage.getPokemon(withId: 1)
let item = storage.getItem(withId: 1)
let trainer = storage.getTrainer(withId: 1)

if let pokemon {
    print(pokemon)
} else {
    print("Pokemon was not loaded correctly")
}

if let item {
    print(item)
} else {
    print("Item was not loaded correctly")
}

if let trainer {
    print(trainer)
} else {
    print("Trainer was not loaded correctly")
}
