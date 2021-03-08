import UIKit

//1. Написать функцию, которая определяет, четное число или нет.

func checkEvenNum (num: Int) -> Bool {
    var checkEven: Bool? = nil
    if num % 2 == 0 && num != 0{
        checkEven = true
        return checkEven!
    } else {
        checkEven = false
        return checkEven!
    }
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func checkThreeNum (num: Int) -> Bool {
    var checkThree: Bool? = nil
    if num % 3 == 0 && num != 0{
        checkThree = true
        return checkThree!
    } else {
        checkThree = false
        return checkThree!
    }
}

//3. Создать возрастающий массив из 100 чисел.

func makeArray (arrayCount count: Int) -> [Int] {
    var array = [Int] ()
    for i in 0 ..< count {
        array.append(i)
    }
    return array
}

let controlOneArray = makeArray(arrayCount: 100)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

func deleteEvenThree (array: [Int]) -> [Int] {
   var newArray = array
    for value in newArray {
        if checkEvenNum (num: value) == true {
            newArray.remove(at: newArray.firstIndex(of: value)!)
        } else if checkThreeNum(num: value) == false {
            newArray.remove(at: newArray.firstIndex(of: value)!)
        }
    }
    
    return newArray
}

let controlTwoArray = deleteEvenThree(array: controlOneArray)

//5.  Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов. Числа Фибоначчи определяются соотношениями Fn = Fn-1 + Fn-2.

func newFibonachiNum (array: [Int], fibonachiNumCount: Int) -> [Int] {
    var newArray = array
    var addNum = 0
    var count = 0
    if array.count < 2 {
        print("В массиве недостаточно элементов для расчета чисел Фибоначчи")
        return array
    } else {
        while count < fibonachiNumCount {
            addNum = newArray.last! + newArray[newArray.count - 2]
            newArray.append(addNum)
            count += 1
        }
    }
    return (newArray)
}

let controlFibbonachi = newFibonachiNum(array: controlTwoArray, fibonachiNumCount: 50)


/*6. Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.*/

func getPrimeArray (maxNum: Int) -> [Int] {
var array = [Int]()
for i in 2 ... maxNum {
    array.append(i)
}

var p = 2
while p <= maxNum {
    for value in array {
        if value != p {
            if value % p == 0 {
                array.remove(at: array.firstIndex(of: value)!)
            }
        }
    }
p = p + 1
}
return array
}

let controlPrime = getPrimeArray(maxNum: 100)

