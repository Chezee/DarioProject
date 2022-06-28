//
//  HomeCell.swift
//  DarioWeather
//
//  Created by ILLIA HOREVOI on 28.06.2022.
//

import SwiftUI

struct HomeCell: View {
    var model: HomeCellModel
    
    var body: some View {
        ZStack {
            Color(Constants.backgroundColor)
            VStack(alignment: .leading, spacing: Sizes.elementSpacing) {
                if let url = model.iconURL {
                    AsyncImage(url: URL(string: url))
                }
                title
                description
                temperature.padding(.bottom, Sizes.bottomPadding)
            }
            .foregroundColor(.black)
        }
        .cornerRadius(Sizes.cornerRadius)
        .padding(.horizontal, Sizes.viewsPadding)
    }
    
    var title: some View {
        Text(model.name)
            .padding(.leading, Sizes.titlePadding)
            .font(.title2.weight(.semibold))
    }
    
    var description: some View {
        Text(model.description ?? "")
            .padding(.leading, Sizes.titlePadding)
    }
    
    var temperature: some View {
        HStack {
            Text("\(Constants.minimumTemperatureText) \(model.tempValues.min)")
                .padding(.leading, Sizes.titlePadding)
            Spacer()
            Text("\(Constants.maximumTemperatureText) \(model.tempValues.max)")
                .padding(.trailing, Sizes.titlePadding)
        }
        .font(.system(size: Sizes.temperatureFontSize))
    }
}

extension HomeCell {
    enum Constants {
        static let backgroundColor = "BackgroundColor"
        static let maximumTemperatureText = "Maximum:"
        static let minimumTemperatureText = "Minimum:"
    }
    
    enum Sizes {
        static let titlePadding: CGFloat = 10
        static let bottomPadding: CGFloat = 10
        static let viewsPadding: CGFloat = 10
        static let cornerRadius: CGFloat = 15
        static let temperatureFontSize: CGFloat = 15
        static let elementSpacing: CGFloat = 5
    }
}
