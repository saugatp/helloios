//
//  ModalAppData.swift
//  helloios
//
//  Created by Saugat Poudel on 01/07/2024.
//

import Foundation

@Observable
class ModalAppData{
    var appResults: [AppResult] = []
    init() {
            Task {
                self.appResults = await loadUrl()
            }
        }
}

func loadUrl() async ->[AppResult] {
    guard let url = URL(string:"https://saugat45.pythonanywhere.com/apps")
    else{
        return []
    }
    do{
        let (data, _) = try await URLSession.shared.data(from: url)
        if let decodedResponse = try? JSONDecoder().decode([AppResult].self, from: data) {
            return decodedResponse
        }
    } catch{
        print("Error")
    }
    return []
}
