//
//  LocalStorage.swift
//  GenericStorage
//

import Foundation

enum LocalStorageError: Error {
    case fileNotFound(_ filename: String)
}

final class LocalStorageImpl {
    
    private var items: [Item] = []
    private var pokemons: [Pokemon] = []
    private var trainers: [Trainer] = []
    
    // MARK: - Init
    
    init() {
        try? loadItems()
        try? loadPokemons()
        try? loadTrainers()
    }
    
    // MARK: - Private Loading
    
    private func loadPokemons() throws {
        let jsonURL = try getURL(forJsonFileName: "pokemon")
        let data = try Data(contentsOf: jsonURL)
        pokemons = try JSONDecoder().decode([Pokemon].self, from: data)
    }
    
    private func loadItems() throws {
        let jsonURL = try getURL(forJsonFileName: "item")
        let data = try Data(contentsOf: jsonURL)
        items = try JSONDecoder().decode([Item].self, from: data)
    }
    
    private func loadTrainers() throws {
        let jsonURL = try getURL(forJsonFileName: "trainer")
        let data = try Data(contentsOf: jsonURL)
        trainers = try JSONDecoder().decode([Trainer].self, from: data)
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
