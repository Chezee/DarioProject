import Foundation
import Combine
import DataBase

public protocol WeatherNetwork {
    var currentWeatherModels: Published<LoadingState<[CityWeather]>>.Publisher { get }
    var forecastWeatherModels: Published<LoadingState<[CityForecast]>>.Publisher { get }
    
    func getCurrentWeather() async
    func getForecast(code: String) async
    func changeUnits()
}

public class WeatherNetworkImpl: WeatherNetwork {
    public static var shared: WeatherNetwork = WeatherNetworkImpl()
    
    public var currentWeatherModels: Published<LoadingState<[CityWeather]>>.Publisher {
        $allCurrentModels
    }
    public var forecastWeatherModels: Published<LoadingState<[CityForecast]>>.Publisher {
        $allForecastModels
    }
    
    var config: Config = Config()
    let session = URLSession(configuration: .default)
    
    @Published var allCurrentModels: LoadingState<[CityWeather]> = .notStarted
    @Published var allForecastModels: LoadingState<[CityForecast]> = .notStarted
    
    private init() { }
    
    public func getCurrentWeather() async {
        // We can think here about Reachability and try to raise an error if there is no Internet
        
        allCurrentModels = .inProgress
        var cache: [CityWeather] = []
        for cityID in Config.MainCities.allCases {
            let result = await fetchCurrentWeather(for: cityID)
            switch result {
            case .success(let entity):
                cache.append(entity)
            case .failure(let error):
                print(error)
                allCurrentModels = .error(error)
            }
        }
        
        allCurrentModels = .loaded(cache)
    }
    
    public func getForecast(code: String) async {
        
    }
    
    public func changeUnits() {
        config.isMetrics = !config.isMetrics
        Task {
            await getCurrentWeather()
        }
    }
}

private extension WeatherNetworkImpl {
    func fetchCurrentWeather(for cityID: Config.MainCities) async -> Result<CityWeather, Error> {
        guard let request = makeRequestForCurrentWeather(for: cityID) else {
            return .failure(CocoaError(.executableLink))
        }
        
        do {
            let (data, response) = try await session.data(for: request)
            if let error = parseResponse(response) {
                return .failure(error)
            }
            return try parseRecievedCurrentWeather(data: data)
        } catch {
            print("Error to fetch data: \(error.localizedDescription)")
            return .failure(error)
        }
    }
    
    func parseResponse(_ response: URLResponse) -> Error? {
        // Here you can parse your response for known possible errors like an 'unathorized', missed data or anything else
        return nil
    }
    
    func makeRequestForCurrentWeather(for cityID: Config.MainCities) -> URLRequest? {
        guard let url = URL(string: config.getLinkToCurrent(by: cityID.rawValue)) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
    func parseRecievedCurrentWeather(data: Data) throws -> Result<CityWeather, Error> {
        let decoder = JSONDecoder()
        do {
            return .success(try decoder.decode(CityWeather.self, from: data))
        } catch {
            return .failure(error)
        }
    }
}

private extension WeatherNetworkImpl {
    
    func fetchForecast(for cityID: Config.MainCities) async {
        
    }
}
