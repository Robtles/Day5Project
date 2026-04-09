//
//  LocalStorage.swift
//  GenericStorage
//

import Foundation

enum LocalStorageError: Error {
    case fileNotFound(_ filename: String)
}

protocol LocalStorage {
    func getPokemon(withId id: Int) -> Pokemon?
    func getItem(withId id: Int) -> Item?
    func getTrainer(withId id: Int) -> Trainer?
}

final class LocalStorageImpl: LocalStorage {
    
    private var items: [Item] = []
    private var pokemons: [Pokemon] = []
    private var trainers: [Trainer] = []
    
    // MARK: - Init
    
    init() {
        try? loadItems()
        try? loadPokemons()
        try? loadTrainers()
    }
    
    // MARK: - Public API
    
    func getPokemon(withId id: Int) -> Pokemon? {
        // TODO: retourner le Pokemon correspondant à cet id
        nil
    }
    
    func getItem(withId id: Int) -> Item? {
        // TODO: retourner l'Item correspondant à cet id
        nil
    }
    
    func getTrainer(withId id: Int) -> Trainer? {
        // TODO: retourner le Trainer correspondant à cet id
        nil
    }
    
    // MARK: - Private Loading
    
    private func loadPokemons() throws {
        // TODO: utiliser getURL(forJsonFileName:) et charger les pokemons
    }
    
    private func loadItems() throws {
        // TODO: utiliser getURL(forJsonFileName:) et charger les items
    }
    
    private func loadTrainers() throws {
        // TODO: utiliser getURL(forJsonFileName:) et charger les trainers
    }
    
    private func getURL(forJsonFileName filename: String) throws -> URL {
        guard let bundleURL = Bundle.main.url(forResource: "ResourceBundle", withExtension: "bundle"),
              let bundle = Bundle(url: bundleURL),
              let jsonURL = bundle.url(forResource: filename, withExtension: "json") else {
            throw LocalStorageError.fileNotFound(filename + ".json")
        }
        
        return jsonURL
    }
}
