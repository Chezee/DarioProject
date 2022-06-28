//
//  MapViewModel.swift
//  DarioWeather
//
//  Created by ILLIA HOREVOI on 28.06.2022.
//

import SwiftUI
import MapKit

struct MapViewModel {
    @State var region: MKCoordinateRegion
    
    init(coordinates: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        region = MKCoordinateRegion(center: coordinates,
                                    span: span)
    }
    
}
