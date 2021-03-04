import UIKit


//1. Решить квадратное уравнение.

let a: Double = 1
let b: Double = 3
let c: Double = 4
let discr: Double
var x: Double

discr = pow(b, 2) - (4 * a * c)

if discr < 0 {
    let string = "Дискриминант меньше 0.\nКорней нет."
    print(string)
} else if discr == 0 {
    x = -b / (2 * a)
    print("Дискриминант равен 0.\nКорень равен " + String(x))
} else {
    x = (-b - (sqrt(discr))) / (2 * a)
    print("Дискриминант равен " + String(discr) + ".\nПервый корень равен " + String(x))
    x = (-b + (sqrt(discr))) / (2 * a)
    print("Второй корень равен " + String(x))
}


//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let catetOne: Double = 4
let catetTwo: Double = 7
let hypotenuse: Double
let area: Double
let perimetr: Double

hypotenuse = sqrt((pow(catetOne, 2) + pow(catetTwo, 2)))
area = (catetOne * catetTwo) / 2
perimetr = hypotenuse + catetOne + catetTwo

print("Площадь треугольника равна " + String(area) + "\nПериметр треугольника равен " + String(perimetr) + "\nГипотенуза треугольника равна " + String(hypotenuse))


//3. *Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var sumEachYear: Float = 200
let annualPercentage: Float = 40
var annualSum: Float
var year = 1

for _ in 1...5 {
    annualSum = sumEachYear * (annualPercentage / 100)
    sumEachYear = sumEachYear + annualSum
    
    //для удобства отображения годовые суммы приведены к целым значениям
    
    if year == 1 {
        print("Сумма через " + String(year) + " год составит " + String(Int(sumEachYear)) + " рублей.")
    } else if year <= 4 {
        print("Сумма через " + String(year) + " года составит " + String(Int(sumEachYear)) + " рублей.")
    } else {
        print("Сумма через " + String(year) + " лет составит " + String(Int(sumEachYear)) + " рублей.")
    }
    year += 1
}

