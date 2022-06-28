/// Here we can organize Cache system and database at all
/// At start we have to load from file or something all of our data and write it to properties
/// Because of luck of time I will not do that but can answer all the questions about structure, files and other

public struct DataBase {
    
    public static var cache: DataBase = DataBase()
    public var cachedCurrentWeather: [CityWeather] = []
    
    public init() {
        //Read from file
        //Write to properties
    }
    
    public func saveObject(_ object: AnyObject) {
        // We have to organize system to find exact object identify it and save to database
        save()
    }
    
    public func save() {
        // General save function
    }
}
