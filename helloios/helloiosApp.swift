//
//  helloiosApp.swift
//  helloios
//
//  Created by Saugat Poudel on 10/01/2024.
//
import SwiftUI

@main
struct HelloiosApp: App {
    @State private var modalData = ModalData()
    @State private var modalAppData = ModalAppData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modalAppData)
        }
    }
}

