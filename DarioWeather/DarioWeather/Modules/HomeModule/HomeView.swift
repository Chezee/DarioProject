//
//  Home.swift
//  DarioWeather
//
//  Created by ILLIA HOREVOI on 28.06.2022.
//

import SwiftUI
import DataBase

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.entities.isEmpty {
                ProgressView()
            } else {
                scroll
                    .padding(.horizontal, Sizes.horizontalPadding)
            }
        }
        .navigationBarItems(trailing: changeUnitsButton)
        .searchable(text: $viewModel.searchText, prompt: Constants.searchPrompt)
        .onSubmit(of: .search) {
            viewModel.filter()
        }
    }
    
    var scroll: some View {
        ScrollView {
            VStack(spacing: Sizes.scrollSpactiong) {
                ForEach(viewModel.entities) { model in
                    // I would strongly not recommend use this way. I'll use only because of limited time
                    NavigationLink {
                        let viewModel = MapViewModel(coordinates: model.coordinates)
                        CityMapView(viewModel: viewModel)
                    } label: {
                        getCell(for: model).padding(.horizontal, Sizes.horizontalPadding)
                    }
                }
            }
        }
    }
    
    func getCell(for model: CityWeather) -> some View {
        let mainConditions = model.main
        let weather = model.weather.first
        let cellModel = HomeCellModel(name: model.name,
                                      tempValues: (min: Int(mainConditions.minimum), max: Int(mainConditions.maximum)),
                                      iconURL: weather?.iconURL ,
                                      description: weather?.description )
        
        return HomeCell(model: cellModel)
    }
    
    var changeUnitsButton: some View {
        Button(action: {
            viewModel.changeUnits()
        }, label: {
            Image(systemName: Constants.changeUnitsIconName)
                .foregroundColor(.green)
        })
    }
}

extension HomeView {
    enum Constants {
        static var changeUnitsIconName: String = "shuffle.circle"
        static var searchPrompt: String = "Search for a city"
    }
    
    enum Sizes {
        static let horizontalPadding: CGFloat = 0
        static let scrollSpactiong: CGFloat = 20
    }
}
