/*
Функции
*/

// Функции — это автономные фрагменты кода, выполняющие определённую задачу.

// У каждой функции есть определённый тип функции, состоящий из типов параметров и возвращаемого функцией значения

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// В этом примере определены две простые математические функции, называемые addTwoInts и multiplyTwoInts. 
// Каждая из этих функций принимает два значения Int и возвращает значение Int, 
// которое является результатом выполнения соответствующей математической операции.

// Тип обеих этих функций — (Int, Int) -> Int. Это можно прочитать как:
// «Функция, у которой есть два параметра, оба типа Int, и которая возвращает значение типа Int».

// Вы используете типы функций так же, как и любые другие типы в Swift. 
// Например, вы можете определить константу или переменную типа функции 
// и присвоить этой переменной соответствующую функцию

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts

// Вы можете использовать тип функции, например (Int, Int) -> Int в качестве типа параметра для другой функции.

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5) // Prints "Result: 8"

// Вы можете использовать тип функции в качестве возвращаемого типа другой функции.

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function

// Определение и вызов функций

// При определении функции вы можете дополнительно указать одно или несколько именованных значений определённого типа, 
// которые функция принимает в качестве входных данных, известных как параметры. Вы также можете дополнительно указать 
// тип значения, которое функция будет возвращать в качестве выходного, известного как тип возвращаемого значения.

// У каждой функции есть имя, которое описывает задачу, которую выполняет функция. Чтобы использовать функцию, 
// вы «вызываете» её по имени и передаёте ей входные значения (известные как аргументы), которые соответствуют 
// типам параметров функции.

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna")) // "Hello, Anna!"
print(greet(person: "Brian")) // "Hello, Brian!"

// Функции без параметров

func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// Prints "hello, world"

// Функции с несколькими параметрами

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// Prints "Hello again, Tim!"

// Функции без возвращаемых значений

func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")
// Prints "Hello, Dave!"

// Строго говоря, эта версия функции greet(person:) всё равно возвращает значение, даже если оно не определено. 
// Функции без определённого типа возвращаемого значения возвращают специальное значение типа Void. 
// Это просто пустой кортеж, который записывается как ().

// Функции с несколькими возвращаемыми значениями

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"

// Тип необязательного кортежа, например (Int, Int)? отличается от кортежа, содержащего необязательные типы, 
// например (Int?, Int?). При использовании типа необязательного кортежа необязательным является весь кортеж, 
// а не только каждое отдельное значение в нём.

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// Функции с неявным возвратом

// Если всё тело функции представляет собой одно выражение, функция неявно возвращает это выражение. 
// Например, обе приведённые ниже функции ведут себя одинаково

func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))
// Prints "Hello, Dave!"


func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))
// Prints "Hello, Dave!"




