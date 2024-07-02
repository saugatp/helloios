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
    
    var filteredLandmarks : [Result] {
        modalAppData.appResults.filter{ app in
            (!favoritesOnly || app.status=="Alive")
        }
    }
    
    var body: some View {
        NavigationSplitView{
            List(){
                Toggle(isOn: $favoritesOnly, label: {
                    Text("Show Alive Only")
                })
                ForEach(filteredLandmarks){ result in
                    HStack{
                        AsyncImage(url: URL(string: result.image)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.green
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        VStack(alignment:.leading){
                            Text(result.name).lineLimit(1)
                            Text(result.status).font(.subheadline).foregroundStyle(.gray).lineLimit(1)
                        }
                    }
//                    NavigationLink{
//                        LandmarkDetails(landmark: landmark)
//                    } label:{
//                        LandmarkRow(landmark: landmark)
//                    }
                }
                Button("Load More") {
                                Task {
                                    await modalAppData.loadData()
                                }
                            }
                
            }.animation(.default, value: filteredLandmarks)
                .navigationTitle("Rick and morties")
        } detail: {
            Text("Select a landmark")
        }
    }
    
}
