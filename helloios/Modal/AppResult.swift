//
//  AppResult.swift
//  helloios
//
//  Created by Saugat Poudel on 01/07/2024.
//

import Foundation
struct AppResult: Hashable, Codable, Identifiable{
    var id: String
    var developer: String
    var icon: String
    var name: String
}
