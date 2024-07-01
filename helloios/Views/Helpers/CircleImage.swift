//
//  CircleImage.swift
//  helloios
//
//  Created by Saugat Poudel on 28/06/2024.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image.resizable().scaledToFill().frame(width: 200, height: 200).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay{
            Circle().stroke(.white, lineWidth: 4).shadow(radius: 7)
        }
    }
}
