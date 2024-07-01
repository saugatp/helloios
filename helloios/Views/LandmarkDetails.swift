//
//  LandmarkDetails.swift
//  helloios
//
//  Created by Saugat Poudel on 29/06/2024.
//

import SwiftUI

struct LandmarkDetails: View {
    @Environment(ModalData.self) var modalData
    
    var landmark: Landmark
    var landmarkIndex: Int {
        modalData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        @Bindable var modalData = modalData
        ScrollView {
            MapView(coordinates: landmark.locationCoordinates)
                        .frame(height: 300)

            CircleImage(image: landmark.image)
                        .offset(y: -130)
                        .padding(.bottom, -130)

                    VStack(alignment: .leading) {
                        HStack{
                            TextField("Enter new name",text: $modalData.landmarks[landmarkIndex].name).font(.title)
                            FavoriteButton(isSet: $modalData.landmarks[landmarkIndex]
                                .isFavorite)
                            
                        }
                        HStack {
                            Text(landmark.park)
                            Spacer()
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)


                        Divider()


                        Text("About \(landmark.name)")
                            .font(.title2)
                        Text(landmark.description)
                    }
                    .padding()
        }.navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}
