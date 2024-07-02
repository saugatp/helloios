//
//  ModalAppData.swift
//  helloios
//
//  Created by Saugat Poudel on 01/07/2024.
//

import Foundation

@Observable
class ModalAppData{
    var appResults: [Result] = []
    var currentPage: Int = 1
    func loadData() async {
        let rslts = await loadUrl(page:currentPage)
        self.appResults.append(contentsOf:rslts)
        currentPage+=1
    }
    
    init() {
            Task {
                let rslts = await loadUrl(page:currentPage)
                self.appResults.append(contentsOf:rslts)
                currentPage+=1
            }
        }
}

func loadUrl(page:Int) async ->[Result] {
    
    guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
        print("Invalid URL")
        return []
    }
    do{
        let (data, _) = try await URLSession.shared.data(from: url)
        if let decodedResponse = try? JSONDecoder().decode(AppResult.self, from: data) {
            return decodedResponse.results
        }
    } catch{
        print("Error")
    }
    return []
}
