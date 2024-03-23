struct Car: Hashable {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineRunning: Bool
    var windowsOpen: Bool
    var filledTrunkVolume: Double
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(year)
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.brand == rhs.brand && lhs.year == rhs.year
    }
    mutating func performAction(action: CarAction) {
        switch action {
        case .startEngine:
            engineRunning = true
        case .stopEngine:
            engineRunning = false
        case .openWindows:
            windowsOpen = true
        case .closeWindows:
            windowsOpen = false
        case .loadCargo(let volume):
            filledTrunkVolume += volume
        case .unloadCargo(let volume):
            filledTrunkVolume -= volume
        }
    }
}

struct Truck: Hashable {
    var brand: String
    var year: Int
    var bodyVolume: Double
    var engineRunning: Bool
    var windowsOpen: Bool
    var filledBodyVolume: Double
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(year)
    }
    
    static func == (lhs: Truck, rhs: Truck) -> Bool {
        return lhs.brand == rhs.brand && lhs.year == rhs.year
    }

    mutating func performAction(action: TruckAction) {
        switch action {
        case .startEngine:
            engineRunning = true
        case .stopEngine:
            engineRunning = false
        case .openWindows:
            windowsOpen = true
        case .closeWindows:
            windowsOpen = false
        case .loadCargo(let volume):
            filledBodyVolume += volume
        case .unloadCargo(let volume):
            filledBodyVolume -= volume
        }
    }
}

                                                                         // Перечисление действий с автомобилем
enum CarAction {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(Double)
    case unloadCargo(Double)
}

                                                                         // Перечисление действий с грузовиком
enum TruckAction {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(Double)
    case unloadCargo(Double)
}

                                                                         // Инициализация экземпляров структур
var car = Car(brand: "Toyota", year: 2020, trunkVolume: 500, engineRunning: false, windowsOpen: false, filledTrunkVolume: 0)
var truck = Truck(brand: "Volvo", year: 2018, bodyVolume: 3000, engineRunning: false, windowsOpen: true, filledBodyVolume: 1000)

                                                                         // Применение различных действий к автомобилям
car.performAction(action: .startEngine)
car.performAction(action: .openWindows)
car.performAction(action: .loadCargo(200))

truck.performAction(action: .startEngine)
truck.performAction(action: .closeWindows)
truck.performAction(action: .unloadCargo(500))

                                                                         // Добавление объектов в словарь
var dict: [AnyHashable: String] = [:]
dict[car] = "car"
dict[truck] = "truck"

print(dict)
