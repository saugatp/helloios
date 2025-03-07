//
//  ModalData.swift
//  helloios
//
//  Created by Saugat Poudel on 29/06/2024.
//

import Foundation

@Observable
class ModalData{
    var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ filename: String)-> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldnt find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }
    catch{
        fatalError("Couldnt load \(filename) from main bundle \n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch{
        fatalError("Couldnt parse \(filename) as \(T.self):\n\(error)")
    }
}
