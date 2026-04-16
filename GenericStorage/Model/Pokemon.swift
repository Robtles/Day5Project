//
//  Pokemon.swift
//  GenericStorage
//

import Foundation

public struct Pokemon: Decodable {
    public let id: Int
    public let name: String
    public let type: String
    public let level: Int
}
