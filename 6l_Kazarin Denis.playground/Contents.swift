import UIKit

enum Body: String {
    case sport
    case tank
    case sedan
    case lorry
}

protocol Movable {
    var mark: String {get}
    var kind: Body {get}
    var color: UIColor {get}
}

class Car: Movable, CustomStringConvertible {
    let mark: String
    let kind: Body
    let color: UIColor
    
    init(mark: String, kind: Body, color: UIColor) {
        self.mark = mark
        self.kind = kind
        self.color = color
    }
    
    var description: String {
        return "\(self.mark), \(self.kind), \(self.color)"
    }
}

let sportCarOne = Car(mark: "McLaren", kind: .sport, color: .black)
let sportCarTwo = Car(mark: "Lotus", kind: .sport, color: .yellow)
let tankCarOne = Car(mark: "Volvo", kind: .tank, color: .blue)
let tankCarTwo = Car(mark: "Scania", kind: .tank, color: .gray)
let sedanCarOne = Car(mark: "VW Polo", kind: .sedan, color: .black)
let sedanCarTwo = Car(mark: "BMW", kind: .sedan, color: .gray)
let lorryCarOne = Car(mark: "Volvo", kind: .lorry, color: .green)
let lorryCarTwo = Car(mark: "Isuzu", kind: .lorry, color: .yellow)


// 1. Создание дженерика типа "очередь" для объектов поддерживающих протокол Movable

class Queue<T: Movable> {
    private var elements: [T] = []
    func push(queue_member: T) {
        self.elements.append(queue_member)
    }
    
    func pop() -> T? {
        guard !self.elements.isEmpty else {return nil}
        return self.elements.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return "\(elements)"
    }
}

// Проверка работоспособности дженерика путем создания очереди контроля камер дорожного движения:

var trafficControlCamQueue = Queue<Car>()

trafficControlCamQueue.push(queue_member: sportCarOne)
trafficControlCamQueue.push(queue_member: lorryCarTwo)
trafficControlCamQueue.push(queue_member: tankCarOne)
trafficControlCamQueue.push(queue_member: sportCarTwo)
trafficControlCamQueue.push(queue_member: sedanCarTwo)
trafficControlCamQueue.push(queue_member: tankCarTwo)
trafficControlCamQueue.push(queue_member: lorryCarOne)
trafficControlCamQueue.push(queue_member: sedanCarOne)

var firstMovingCar = trafficControlCamQueue.pop()
print(firstMovingCar!)
var secondMovingCar = trafficControlCamQueue.pop()
print(secondMovingCar!)
print(trafficControlCamQueue)


// 2. Добавление методов высшего порядка для работы с созданной очередью:

// 2.1 Фильтр по типу кузова автомобилей:

extension Queue {
    func filter(_ filter_parametr: (Body) -> Bool) -> [T] {
        var tmpArray: [T] = []
        for element in self.elements {
            if filter_parametr(element.kind){
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
}

// Фильтрация очереди по типу кузова Sedan:

var sedanCar: (Body) -> Bool = {$0 == .sedan}
print(trafficControlCamQueue.filter(sedanCar))

// Второй вариант ввода типа кузова (кузов Sport):

print(trafficControlCamQueue.filter({$0 == .sport}))

//2.2 Создание списка автомобилей в алфавитном порядке с использованием стандартной функции высшего порядка "sort":

extension Queue {
    func alphabetSortCarList() -> [T] {
        elements.sort(by: {$0.mark < $1.mark})
        return elements
    }
}

print(trafficControlCamQueue.alphabetSortCarList())

// 3. Создание subscription, возвращающего "nil" при отсутствии элемента в очереди:

extension Queue {
    subscript (index: Int) -> T? {
        guard index < elements.count && index >= 0 else { return nil }
        return elements[index]
    }
}

print(trafficControlCamQueue[3]!)
print(trafficControlCamQueue[11] as Any)
print(trafficControlCamQueue[-1] as Any)


