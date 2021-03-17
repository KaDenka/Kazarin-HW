import UIKit

enum Engine: String {
    case start, stop
}

enum Window: String {
    case open, close
}

enum Switcher: String {
    case on, off
}

enum Trunk: String {
    case up, down
}

protocol Car: AnyObject {
    var mark: String {get}
    var wheelsCount: Int {get}
    var doorsCount: Int {get}
    var maxTrunkVolume: Int {get}
    var fuelTankVolume: Int {get}
    var actualFuelLevel: Int {get set}
    var actualCargoLoad: Int {get set}
    var windowState: Window {get set}
    var engineState: Engine {get set}
    
    func engineAction(startStop: Engine)
}

extension Car {
    func engineAction(startStop: Engine) {
        switch startStop  {
        case .start:
            guard engineState != .start else {
                print("Двигатель уже \(engineState.rawValue).")
                return
            }
            print("Двигатель \(engineState.rawValue).")
            engineState = .start
        case .stop:
            guard engineState != .stop else {
                print("Двигатель уже \(engineState.rawValue).")
                return
            }
            print("Двигатель \(engineState.rawValue).")
            engineState = .stop
        }
    }
}

extension Car {
    func windowAction(openClose: Window) {
        switch openClose  {
        case .open:
            guard windowState != .open else {
                print("Окно уже \(windowState.rawValue).")
                return
            }
            print("Окно \(windowState.rawValue).")
            windowState = .open
        case .close:
            guard windowState != .close else {
                print("Окно уже \(windowState.rawValue).")
                return
            }
            print("Окно \(windowState.rawValue).")
            windowState = .close
        }
    }
}

extension Car {
    func loadCargo(volume: Int) {
        guard (actualCargoLoad + volume) <= maxTrunkVolume else {
            print("Вы не можете загрузить \(volume), так как у вас уже загружено \(actualCargoLoad), а всего можно разместить \(maxTrunkVolume).")
            return
        }
        actualCargoLoad = actualCargoLoad + volume
        print("Дополнительно загружено \(volume), всего загружено груза \(actualCargoLoad).")
    }
    
    func unloadCargo(volume: Int) {
        guard (actualCargoLoad - volume) >= 0 else {
            print("Вы не можете выгрузить \(volume), так как загружено всего \(actualCargoLoad).")
            return
        }
        actualCargoLoad = actualCargoLoad - volume
        print("Выгружено \(volume), осталось \(actualCargoLoad).")
    }
}

extension Car {
    func refueling(volume: Int) {
        guard (actualFuelLevel + volume) <= fuelTankVolume else {
            print("Вы не можете залить \(volume), так как у вас уже заправлено \(actualFuelLevel), а всего можно разместить \(fuelTankVolume).")
            return
        }
        actualFuelLevel = actualFuelLevel + volume
        print("Дополнительно заправлено \(volume), всего топлива \(actualFuelLevel).")
    }
}


class SportCar: Car {
    
    let mark: String
    let wheelsCount: Int
    let doorsCount: Int
    let maxTrunkVolume: Int
    let fuelTankVolume: Int
    var actualFuelLevel: Int
    var actualCargoLoad: Int
    var windowState: Window
    var engineState: Engine
    var turboMode: Switcher
    var spoilerMode: Switcher
    
    init (mark: String, wheelsCount: Int, doorsCount: Int, maxTrunkVolume: Int, fuelTankVolume: Int, actualFuelLevel: Int, actualCargoLoad: Int, windowState: Window, engineState: Engine, turboMode: Switcher, spoilerMode: Switcher){
        self.mark = mark
        self.wheelsCount = wheelsCount
        self.doorsCount = doorsCount
        self.maxTrunkVolume = maxTrunkVolume
        self.fuelTankVolume = fuelTankVolume
        self.actualFuelLevel = actualFuelLevel
        self.actualCargoLoad = actualCargoLoad
        self.windowState = windowState
        self.engineState = engineState
        self.turboMode = turboMode
        self.spoilerMode = spoilerMode
    }
    
    func engineAction() {}
    func windowAction() {}
    func loadCargo() {}
    func unloadCargo() {}
    func refueling() {}
    
    func turboMode(switcher: Switcher) {
        switch switcher  {
        case .on:
            guard turboMode != .on else {
                print("Турбонаддув уже \(turboMode.rawValue).")
                return
            }
            print("Турбонаддув \(turboMode.rawValue).")
            turboMode = .on
        case .off:
            guard turboMode != .off else {
                print("Турбонаддув уже \(turboMode.rawValue).")
                return
            }
            print("Турбонаддув \(turboMode.rawValue).")
            turboMode = .off
        }
    }
    
    func spoilerMode(switcher: Switcher) {
        switch switcher  {
        case .on:
            guard spoilerMode != .on else {
                print("Спойлеры уже \(spoilerMode.rawValue).")
                return
            }
            print("Спойлеры \(spoilerMode.rawValue).")
            spoilerMode = .on
        case .off:
            guard spoilerMode != .off else {
                print("Спойлеры уже \(spoilerMode.rawValue).")
                return
            }
            print("Спойлеры \(spoilerMode.rawValue).")
            spoilerMode = .off
        }
    }
}

class TrunkCar: Car {
    let mark: String
    let wheelsCount: Int
    let doorsCount: Int
    let maxTrunkVolume: Int
    let fuelTankVolume: Int
    var actualFuelLevel: Int
    var actualCargoLoad: Int
    var windowState: Window
    var engineState: Engine
    var trunkPosition: Trunk
    var cargoLights: Switcher
    
    init (mark: String, wheelsCount: Int, doorsCount: Int, maxTrunkVolume: Int, fuelTankVolume: Int, actualFuelLevel: Int, actualCargoLoad: Int, windowState: Window, engineState: Engine, trunkPosition: Trunk, cargoLights: Switcher){
        self.mark = mark
        self.wheelsCount = wheelsCount
        self.doorsCount = doorsCount
        self.maxTrunkVolume = maxTrunkVolume
        self.fuelTankVolume = fuelTankVolume
        self.actualFuelLevel = actualFuelLevel
        self.actualCargoLoad = actualCargoLoad
        self.windowState = windowState
        self.engineState = engineState
        self.trunkPosition = trunkPosition
        self.cargoLights = cargoLights
    }
    
    func engineAction() {}
    func windowAction() {}
    func loadCargo() {}
    func unloadCargo() {}
    func refueling() {}
    
    func trunkMode(switcher: Trunk) {
        switch switcher  {
        case .up:
            guard trunkPosition != .up else {
                print("Кузов уже \(trunkPosition.rawValue).")
                return
            }
            print("Кузов \(trunkPosition.rawValue).")
            trunkPosition = .up
        case .down:
            guard trunkPosition != .down else {
                print("Кузов уже \(trunkPosition.rawValue).")
                return
            }
            print("Кузов \(trunkPosition.rawValue).")
            trunkPosition = .down
        }
    }
    
    func cargoLightsMode(switcher: Switcher) {
        switch switcher  {
        case .on:
            guard cargoLights != .on else {
                print("Габаритные огни уже \(cargoLights.rawValue).")
                return
            }
            print("Габаритные огни \(cargoLights.rawValue).")
            cargoLights = .on
        case .off:
            guard cargoLights != .off else {
                print("Габаритные огни уже \(cargoLights.rawValue).")
                return
            }
            print("Габаритные огни \(cargoLights.rawValue).")
            cargoLights = .off
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивный автомобиль \(mark): количество колес \(wheelsCount), количество дверей \(doorsCount), объем бака \(fuelTankVolume), залито топлива \(actualFuelLevel), объем багажника \(maxTrunkVolume), загружено груза \(actualCargoLoad), положение окон \(windowState), статус двигателя \(engineState), режим турбонаддува \(turboMode), положение спойлеров \(spoilerMode)."
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Грузовой автомобиль \(mark): количество колес \(wheelsCount), количество дверей \(doorsCount), объем бака \(fuelTankVolume), залито топлива \(actualFuelLevel), объем багажника \(maxTrunkVolume), загружено груза \(actualCargoLoad), положение окон \(windowState), статус двигателя \(engineState), положение кузова \(trunkPosition), габаритные огни \(cargoLights)."
    }
}

var sportCarOne = SportCar(mark: "Ferrari", wheelsCount: 4, doorsCount: 2, maxTrunkVolume: 20, fuelTankVolume: 500, actualFuelLevel: 250, actualCargoLoad: 10, windowState: .close, engineState: .stop, turboMode: .off, spoilerMode: .off)

var trunkCarOne = TrunkCar(mark: "Volvo", wheelsCount: 8, doorsCount: 2, maxTrunkVolume: 5000, fuelTankVolume: 2000, actualFuelLevel: 1500, actualCargoLoad: 3000, windowState: .open, engineState: .start, trunkPosition: .down, cargoLights: .on)

sportCarOne.engineAction(startStop: .start)
sportCarOne.windowAction(openClose: .close)
sportCarOne.refueling(volume: 250)

trunkCarOne.trunkMode(switcher: .up)
trunkCarOne.unloadCargo(volume: 1350)
trunkCarOne.engineAction(startStop: .stop)

print(sportCarOne)
print(trunkCarOne)

