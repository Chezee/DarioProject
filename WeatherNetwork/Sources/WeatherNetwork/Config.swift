//
//  Config.swift
//  
//
//  Created by ILLIA HOREVOI on 28.06.2022.
//

import Foundation

struct Config {
    fileprivate let apiKey = "0cd74bf29e43ef1ad6afd6861cc99eb2"
    fileprivate let baseLink = "https://api.openweathermap.org/data/2.5/"
    
    var isMetrics: Bool = true
    
    func getLinkToForecast(by cityID: Int) -> String {
        let units = isMetrics ? Units.metric.rawValue : Units.imperial.rawValue
        return "\(baseLink)forecast?id=\(cityID)&units=\(units)&appid=\(apiKey)"
    }
    
    func getLinkToCurrent(by cityID: Int) -> String {
        let units = isMetrics ? Units.metric.rawValue : Units.imperial.rawValue
        return "\(baseLink)weather?id=\(cityID)&units=\(units)&appid=\(apiKey)"
    }
}

extension Config {
    
    enum Units: String {
        case metric
        case imperial
    }
 
    enum MainCities: Int, CaseIterable {
        case London = 2643743
        case TelAviv =  293396
        case NewYork = 5128581
        case Brussels = 2800866
        case Barcelona = 3128760
        case Paris = 2988507
        case Tokyo = 1850147
        case Beijing = 1816670
        case Sydney = 2147714
        case BuenosAires = 3432043
        case Miami = 4164138
        case Vancouver = 6173331
        case Bangkok = 1609350
        case Johannesburg = 993800
        case Tunis = 2464470
        case Manila = 1701668
    }
}
