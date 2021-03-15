import UIKit


//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum CarAction {
    case startEngine
    case stopEngine
    case openWindow
    case closeWindow
    case loadCargo (volume: Int)
    case offloadCargo (volume: Int)
}

struct SportCar {
    let markCar: String
    let yearCar: Int
    let trunkVolume: Int
    var onEngine: Bool
    var openWindow: Bool
    var actualLoadedCargo: Int
    
    mutating func carActionResult ( action: CarAction){
        switch action {
        case .startEngine:
            if onEngine == true {
                print("Двигатель " + markCar + " уже запущен.")
            } else {
                print ("Вы запустили двигатель " + markCar)
                self.onEngine = true
            }
        case .stopEngine:
            if self.onEngine == false {
                print("Двигатель " + markCar + " уже остановлен.")
            } else {
                print ("Вы остановили двигатель " + markCar)
                self.onEngine = false
            }
        case .openWindow:
            if self.openWindow == true {
                print("Окно " + markCar + " уже открыто.")
            } else {
                print ("Вы открыли окно " + markCar)
                self.openWindow = true
            }
        case .closeWindow:
            if openWindow == false {
                print("Окно " + markCar + " уже закрыто.")
            }  else {
                print ("Вы закрыли окно " + markCar)
                openWindow = false
            }
        case .loadCargo (let volume):
            if actualLoadedCargo + volume > trunkVolume {
                print("Вы не можете загрузить так много. Объем багажника " + markCar + " " + String(trunkVolume) + " и в нем уже есть " + String(actualLoadedCargo) + "." )
            } else {
                print("У вас в багажнике " + markCar + " " + String(actualLoadedCargo + volume))
                actualLoadedCargo = actualLoadedCargo + volume
            }
        case .offloadCargo (let volume):
            if actualLoadedCargo - volume < 0 {
                print("Вы не можете выгрузить столько из " + markCar + ", у вас в багажнике есть всего " + String(actualLoadedCargo))
            } else {
                print("У вас в багажнике " + markCar + " осталось груза " + String(actualLoadedCargo - volume))
                actualLoadedCargo = actualLoadedCargo - volume
            }
        }
    }
    
}

struct TrunkCar {
    let markCar: String
    let yearCar: Int
    let trunkVolume: Int
    var startEngine: Bool
    var windowsOpen: Bool
    var actualLoadedCargo: Int
    
    mutating func carActionResult ( action: CarAction){
        switch action {
        case .startEngine:
            if self.startEngine == true {
                print("Двигатель " + markCar + " уже запущен.")
            } else {
                print ("Вы запустили двигатель " + markCar)
                self.startEngine = true
            }
        case .stopEngine:
            if startEngine == false {
                print("Двигатель " + markCar + " уже остановлен.")
            } else {
                print ("Вы остановили двигатель " + markCar)
                startEngine = false
            }
        case .openWindow:
            if windowsOpen == true {
                print("Окно " + markCar + " уже открыто.")
            } else {
                print ("Вы открыли окно " + markCar)
                windowsOpen = true
            }
        case .closeWindow:
            if windowsOpen == false {
                print("Окно " + markCar + " уже закрыто.")
            }  else {
                print ("Вы закрыли окно " + markCar)
                windowsOpen = false
            }
        case .loadCargo (let volume):
            if actualLoadedCargo + volume > trunkVolume {
                print("Вы не можете загрузить так много. Объем кузова " + markCar + " " + String(trunkVolume) + " и в нем уже есть " + String(actualLoadedCargo) + "." )
            } else {
                print("У вас в кузове " + markCar + " " + String(actualLoadedCargo + volume))
                actualLoadedCargo = actualLoadedCargo + volume
            }
        case .offloadCargo (let volume):
            if actualLoadedCargo - volume < 0 {
                print("Вы не можете выгрузить столько из " + markCar + ", у вас в кузове есть всего " + String(actualLoadedCargo))
            } else {
                print("У вас в кузове " + markCar + " осталось груза " + String(actualLoadedCargo - volume))
                actualLoadedCargo = actualLoadedCargo - volume
            }
        }
    }
}

var sportCarOne = SportCar(markCar: "Ferrari", yearCar: 2020, trunkVolume: 60, onEngine: false, openWindow: false, actualLoadedCargo: 50)

var sportCarTwo = SportCar(markCar: "McLaren", yearCar: 2019, trunkVolume: 60, onEngine: true, openWindow: true, actualLoadedCargo: 40)

var trunkCarOne = TrunkCar(markCar: "Scania", yearCar: 2016, trunkVolume: 2000, startEngine: true, windowsOpen: false, actualLoadedCargo: 1000)

var trunkCarTwo = TrunkCar(markCar: "Volvo", yearCar: 2018, trunkVolume: 3000, startEngine: true, windowsOpen: true, actualLoadedCargo: 0)



sportCarOne.carActionResult(action: .startEngine)
sportCarTwo.carActionResult(action: .stopEngine)
sportCarOne.carActionResult(action: .loadCargo(volume: 200))
trunkCarOne.carActionResult(action: .loadCargo(volume: 500))
trunkCarTwo.carActionResult(action: .closeWindow)
trunkCarTwo.carActionResult(action: .offloadCargo(volume: 3000))
trunkCarOne.carActionResult(action: .offloadCargo(volume: 300))



print(sportCarOne)
print(sportCarTwo)
print(trunkCarOne)
print(trunkCarTwo)


