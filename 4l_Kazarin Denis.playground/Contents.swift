import UIKit

enum CarTransmission {
    case auto, manual
}

enum WindowsState {
    case open, close
}

enum EngineState {
    case on, off
}

enum Turbocharging {
    case on, off
}

enum SpoilersState  {
    case open, close
}

enum TrunkPosition {
    case up, down
}

enum CargoCarLights {
    case on, off
}

enum CarAction {
    // для всех автомобилей
    case startEngine
    case stopEngine
    case openWindow
    case closeWindow
    case loadCargo (volume: Int)
    case offloadCargo (volume: Int)
    case refuel (volume: Int)
    
    // для спортивных автомобилей
    case turbochargingModeOn
    case turbochargingModeOff
    case openSpoilers
    case closeSpoilers
    
    // для грузовых автомобилей
    case trunkPositionUp
    case trunkPositionDown
    case cargoCarLightsOn
    case cargoCarLightsOff
}

class Car {
    let mark: String
    let year: Int
    let weels: Int
    let doors: Int
    let transmission: CarTransmission
    let fuelTank: Int
    let trunkVolume: Int
    var windowState: WindowsState
    var engineState: EngineState
    var actualLoadedCargo: Int
    var actualFuelLevel: Int
    
    
    init(mark: String, year: Int, weels: Int, doors: Int, transmission: CarTransmission, fuelTank: Int, trunkVolume: Int, windowState: WindowsState, engineState: EngineState, actualLoadedCargo: Int, actualFuelLevel: Int) {
        self.mark = mark
        self.year = year
        self.weels = weels
        self.doors = doors
        self.transmission = transmission
        self.fuelTank = fuelTank
        self.trunkVolume = trunkVolume
        self.windowState = windowState
        self.engineState = engineState
        self.actualLoadedCargo = actualLoadedCargo
        self.actualFuelLevel = actualFuelLevel
    }
    
    func carAction (action: CarAction) { }
    func carInfo () {
        print("Общие данные по машине: марка: \(self.mark), год выпуска: \(self.year), количество колес: \(self.weels), количество дверей: \(self.doors), тип трансмиссии: \(self.transmission), объем бака: \(self.fuelTank), объем багажника/кузова: \(self.trunkVolume), положение окон: \(self.windowState), состояние двигателя: \(self.engineState), загружено груза: \(self.actualLoadedCargo), заправлено топлива: \(self.actualFuelLevel).")
    }
}

class SportCar: Car {
    var turbocharging: Turbocharging
    var spoilersState: SpoilersState
    
    init (mark: String, year: Int, weels: Int, doors: Int, transmission: CarTransmission, fuelTank: Int, trunkVolume: Int, windowState: WindowsState, engineState: EngineState, actualLoadedCargo: Int, actualFuelLevel: Int, turbocharging: Turbocharging, spoilersState: SpoilersState) {
        self.turbocharging = turbocharging
        self.spoilersState = spoilersState
        super.init(mark: mark, year: year, weels: weels, doors: doors, transmission: transmission, fuelTank: fuelTank, trunkVolume: trunkVolume, windowState: windowState, engineState: engineState, actualLoadedCargo: actualLoadedCargo, actualFuelLevel: actualFuelLevel)
    }
    
    override func carAction (action:CarAction) {
        switch action {
        case .startEngine:
            if engineState == .on {
                print("Двигатель уже запущен")
            } else {
                print("Вы запустили двигатель")
                engineState = .on
            }
        case .stopEngine:
            if engineState == .off {
                print("Двигатель уже остановлен")
            } else {
                print("Двигатель выключается")
                engineState = .off
            }
        case .openWindow:
            if windowState == .open {
                print("Окна уже открыты")
            } else {
                print("Окна открываются")
                windowState = .open
            }
        case .closeWindow:
            if windowState == .close {
                print("Окна уже закрыты")
            } else {
                print("Окна закрываются")
                windowState = .close
            }
        case .loadCargo(let volume):
            if (volume + actualLoadedCargo) > trunkVolume {
                print("Нельзя это загрузить, так как у вас есть \(actualLoadedCargo), а максимальный объем \(trunkVolume)")
            } else {
                actualLoadedCargo = actualLoadedCargo + volume
                print("Загружено всего \(actualLoadedCargo)")
            }
        case .offloadCargo(let volume):
            if (actualLoadedCargo - volume) < 0 {
                print("Нельзя выгрузить столько, так как у вас всего загружено \(actualLoadedCargo)")
            } else {
                actualLoadedCargo = actualLoadedCargo - volume
                print("Выгружено \(volume), осталось \(actualLoadedCargo)")
            }
        case .refuel(let volume):
            if (actualFuelLevel + volume) > fuelTank {
                print("Нельзя заправить столько топлива, так как у вас есть \(actualFuelLevel), а общий объем бака \(fuelTank)")
            } else {
                actualFuelLevel = actualFuelLevel + volume
                print("Заправлено \(volume), всего в баке \(actualFuelLevel)")
            }
        case .turbochargingModeOn:
            if turbocharging == .on {
                print("Турбонаддув уже включен")
            } else {
                print("Турбоннадув запущен")
                turbocharging = .on
            }
        case .turbochargingModeOff:
            if turbocharging == .off {
                print("Турбонаддув уже выключен")
            } else {
                print("Турбоннадув выключен")
                turbocharging = .off
            }
        case .openSpoilers:
            if spoilersState == .open {
                print("Спойлеры уже подняты")
            } else {
                print("Спойлеры выпущены")
                spoilersState = .open
            }
        case .closeSpoilers:
            if spoilersState == .close {
                print("Спойлеры уже опущены")
            } else {
                print("Спойлеры убираются")
                spoilersState = .close
            }
        default:
            print("Неприменимо для данного типа машин")
        }
    }
    override func carInfo() {
        super.carInfo()
        print("Специальные данные: режим турбонаддува: \(self.turbocharging), положение спойлеров: \(self.spoilersState).")
    }
}

class TrunkCar: Car {
    var trunkPosition: TrunkPosition
    var cargoCarLights: CargoCarLights
    
    init (mark: String, year: Int, weels: Int, doors: Int, transmission: CarTransmission, fuelTank: Int, trunkVolume: Int, windowState: WindowsState, engineState: EngineState, actualLoadedCargo: Int, actualFuelLevel: Int, trunkPosition: TrunkPosition, cargoCarLights: CargoCarLights) {
        self.trunkPosition = trunkPosition
        self.cargoCarLights = cargoCarLights
        super.init(mark: mark, year: year, weels: weels, doors: doors, transmission: transmission, fuelTank: fuelTank, trunkVolume: trunkVolume, windowState: windowState, engineState: engineState, actualLoadedCargo: actualLoadedCargo, actualFuelLevel: actualFuelLevel)
    }
    override func carAction (action:CarAction) {
        switch action {
        case .startEngine:
            if engineState == .on {
                print("Двигатель уже запущен")
            } else {
                print("Вы запустили двигатель")
                engineState = .on
            }
        case .stopEngine:
            if engineState == .off {
                print("Двигатель уже остановлен")
            } else {
                print("Двигатель выключается")
                engineState = .off
            }
        case .openWindow:
            if windowState == .open {
                print("Окна уже открыты")
            } else {
                print("Окна открываются")
                windowState = .open
            }
        case .closeWindow:
            if windowState == .close {
                print("Окна уже закрыты")
            } else {
                print("Окна закрываются")
                windowState = .close
            }
        case .loadCargo(let volume):
            if (volume + actualLoadedCargo) > trunkVolume {
                print("Нельзя это загрузить, так как у вас есть \(actualLoadedCargo), а максимальный объем \(trunkVolume)")
            } else {
                actualLoadedCargo = actualLoadedCargo + volume
                print("Загружено всего \(actualLoadedCargo)")
            }
        case .offloadCargo(let volume):
            if (actualLoadedCargo - volume) < 0 {
                print("Нельзя выгрузить столько, так как у вас всего загружено \(actualLoadedCargo)")
            } else {
                actualLoadedCargo = actualLoadedCargo - volume
                print("Выгружено \(volume), осталось \(actualLoadedCargo)")
            }
        case .refuel(let volume):
            if (actualFuelLevel + volume) > fuelTank {
                print("Нельзя заправить столько топлива, так как у вас есть \(actualFuelLevel), а общий объем бака \(fuelTank)")
            } else {
                actualFuelLevel = actualFuelLevel + volume
                print("Заправлено \(volume), всего в баке \(actualFuelLevel)")
            }
        case .trunkPositionUp:
            if trunkPosition == .up {
                print("Кузов уже поднят")
            } else {
                print("Кузов поднимается")
                trunkPosition = .up
            }
        case .trunkPositionDown:
            if trunkPosition == .down {
                print("Кузов уже опущен")
            } else {
                print("Кузов опускается")
                trunkPosition = .down
            }
        case .cargoCarLightsOn:
            if cargoCarLights == .on {
                print("Габаритные огни автопоезда уже включены")
            } else {
                print("Габаритные огни включены")
                cargoCarLights = .on
            }
        case .cargoCarLightsOff:
            if cargoCarLights == .off {
                print("Габаритные огни автопоезда уже выключены")
            } else {
                print("Габаритные огни выключены")
                cargoCarLights = .off
            }
        default:
            print("Неприменимо для данного типа машин")
        }
        
    }
    override func carInfo() {
        super.carInfo()
        print("Специальные данные: положение кузова: \(self.trunkPosition), состояние габаритных огней: \(self.cargoCarLights).")
    }
}


var sportCar1 = SportCar(mark: "McLaren", year: 2021, weels: 4, doors: 2, transmission: .manual, fuelTank: 200, trunkVolume: 20, windowState: .open, engineState: .off, actualLoadedCargo: 10, actualFuelLevel: 150, turbocharging: .off, spoilersState: .close)
var trunkCar1 = TrunkCar(mark: "Volvo", year: 2018, weels: 6, doors: 2, transmission: .auto, fuelTank: 2000, trunkVolume: 3000, windowState: .close, engineState: .on, actualLoadedCargo: 500, actualFuelLevel: 1500, trunkPosition: .down, cargoCarLights: .on)

sportCar1.carInfo()
trunkCar1.carInfo()

sportCar1.carAction(action: .startEngine)
sportCar1.carAction(action: .loadCargo(volume: 20))
sportCar1.carAction(action: .cargoCarLightsOff)
trunkCar1.carAction(action: .offloadCargo(volume: 250))
trunkCar1.carAction(action: .stopEngine)
trunkCar1.carAction(action: .cargoCarLightsOff)

sportCar1.carInfo()
trunkCar1.carInfo()










