//
//  AppResult.swift
//  helloios
//
//  Created by Saugat Poudel on 01/07/2024.
//

import Foundation
struct AppResult: Hashable, Codable{
    var results: [Result]
}

struct Result: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var image: String
    var status: String
}
