//
//  LandmarkList.swift
//  helloios
//
//  Created by Saugat Poudel on 29/06/2024.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModalAppData.self) var modalAppData
    @State private var favoritesOnly = false
    
    var filteredLandmarks : [AppResult] {
        modalAppData.appResults.filter{ app in
            (!favoritesOnly || app.id.contains("e"))
        }
    }
    
    var body: some View {
        NavigationSplitView{
            List(){ 
                Toggle(isOn: $favoritesOnly, label: {
                    Text("Show Favorites Only")
                })
                ForEach(filteredLandmarks){ app in
                    HStack{
                        AsyncImage(url: URL(string: app.icon)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.green
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        VStack(alignment:.leading){
                            Text(app.name).lineLimit(1)
                            Text(app.developer).font(.subheadline).foregroundStyle(.gray).lineLimit(1)
                        }
                    }
//                    NavigationLink{
//                        LandmarkDetails(landmark: landmark)
//                    } label:{
//                        LandmarkRow(landmark: landmark)
//                    }
                }
                
            }.animation(.default, value: filteredLandmarks)
                .navigationTitle("Apps")
        } detail: {
            Text("Select a landmark")
        }
    }
    
}
