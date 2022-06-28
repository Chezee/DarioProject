//
//  HomeViewModel.swift
//  DarioWeather
//
//  Created by ILLIA HOREVOI on 28.06.2022.
//

import SwiftUI
import WeatherNetwork
import DataBase

class HomeViewModel: ObservableObject {
    @Published var entities: [CityWeather] = []
    @Published var cachedEntities: [CityWeather] = []

    @State var searchText: String = ""
    
    var network: WeatherNetwork = WeatherNetworkImpl.shared
    
    init() {
        subscribe()
        Task {
            await network.getCurrentWeather()
        }
    }
    
    func subscribe() {
        network.currentWeatherModels.map { models in
            if let _ = models.error {
                // Show error
            }
            return models.value ?? []
        }
        .receive(on: DispatchQueue.main)
        .assign(to: &$entities) // To make it proper search we have to change this to cachedModels filter them and assign to $entities
    }
    
    func changeUnits() {
        network.changeUnits()
    }
 
    func filter() {
        // Here we have to filter the models from cachedEntites and assign to entities from main thread
        entities = cachedEntities.filter { $0.name.contains(searchText) }
    }
}
