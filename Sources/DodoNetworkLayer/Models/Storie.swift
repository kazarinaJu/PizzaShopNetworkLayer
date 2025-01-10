//
//  Storie.swift
//  dodo
//
//  Created by Юлия Ястребова on 20.02.2024.
//

public struct StorieResponse: Codable {
    public let stories: [Storie]
}

public struct Storie: Codable {
    public let id: UInt
    public let image: String
    public var readability: Bool
}
