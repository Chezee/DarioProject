//
//  MapView.swift
//  DarioWeather
//
//  Created by ILLIA HOREVOI on 28.06.2022.
//

import SwiftUI
import MapKit

struct CityMapView: View {
    @State var viewModel: MapViewModel
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $viewModel.region,
                interactionModes: [.zoom, .pan])
        }
    }
}

