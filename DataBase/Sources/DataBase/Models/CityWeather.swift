//
//  CityWeather.swift
//
//
//  Created by ILLIA HOREVOI on 28.06.2022.
//

import Foundation
import CoreLocation

public struct CityWeather: MainObject, Codable, Identifiable {
    public var id: Int
    public var coordinates: CLLocationCoordinate2D
    public var weather: [Weather]
    public var main: MainConditions
    public var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case coordinates = "coord"
        case weather
        case main
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        weather = try container.decode([Weather].self, forKey: .weather)
        main = try container.decode(MainConditions.self, forKey: .main)
        name = try container.decode(String.self, forKey: .name)
        
        let coordinates = try container.decode(CityCoordinates.self, forKey: .coordinates)
        self.coordinates = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    public func encode(to encoder: Encoder) throws {
        // I didn't made any stored cache between launching the app so for now it's fatalError
        fatalError("Encoding is not implemented yet")
    }
}

struct CityCoordinates: Codable {
    var longitude: Double
    var latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}

public struct Weather: Codable {
    var icon: String
    
    public var description: String
    public var iconURL: String {
        "http://openweathermap.org/img/wn/\(icon).png"
    }
}

public struct MainConditions: Codable {
    public var minimum: Double
    public var maximum: Double
    
    public enum CodingKeys: String, CodingKey {
        case minimum = "temp_min"
        case maximum = "temp_max"
    }
}
