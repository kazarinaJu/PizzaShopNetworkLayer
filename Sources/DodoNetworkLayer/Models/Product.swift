//
//  Product.swift
//  dodo
//
//  Created by Юлия Ястребова on 28.01.2024.
//

public struct ProductResponse: Codable {
    let ingredients: [Ingredient]
    let sizes, dough: [String]
    let products: [Product]
}

public struct Product: Codable {
    let id: UInt
    let name: String
    let detail: String
    let description: String
    let weight: Int
    var price: Int
    let image: String
    let portion: Int?
    var size: String?
    var dough: String?
    let isOnSale: Bool
    var count: Int = 1
    let category: ProductSection
    let isPromo: Bool?
    let energyValue: String?
    
    public func sizeIndex(_ size: String) -> Int {
        switch size {
        case "Большая": return 2
        case "Маленькая": return 0
        default: return 1
        }
    }
    
    public func doughIndex(_ dough: String) -> Int {
        switch dough {
        case "Тонкое": return 1
        default: return 0
        }
    }
    
    public static var empty: Product {
        return Product(
            id: 0,
            name: "",
            detail: "",
            description: "",
            weight: 0,
            price: 0,
            image: "",
            portion: 0,
            isOnSale: false,
            category: .pizza,
            isPromo: false,
            energyValue: ""
        )
    }
}

public struct Ingredient: Codable {
    let id: UInt
    let image, name: String
    let price: Int
}

public enum ProductSection: String, Codable, CaseIterable {
    case pizza
    case combo
    case snack
    case drink
    case desert
    case souce
    
    public var description: String {
        switch self {
        case .pizza: return "Пицца"
        case .combo: return "Комбо"
        case .snack: return "Закуски"
        case .drink: return "Напитки"
        case .desert: return "Десерты"
        case .souce: return "Соусы"
        }
    }
}

extension ProductSection {
    public static func from(description: String) -> ProductSection? {
        return ProductSection.allCases.first { $0.description == description }
    }
}

extension Product: Equatable {
    public static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.detail == rhs.detail &&
        lhs.description == rhs.description &&
        lhs.weight == rhs.weight &&
        lhs.price == rhs.price &&
        lhs.image == rhs.image &&
        lhs.portion == rhs.portion &&
        lhs.size == rhs.size &&
        lhs.dough == rhs.dough &&
        lhs.isOnSale == rhs.isOnSale &&
        lhs.count == rhs.count &&
        lhs.category == rhs.category &&
        lhs.isPromo == rhs.isPromo
    }
}



