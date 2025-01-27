/*
Управление потоком
*/

// Swift предоставляет множество инструкций потока управления.

/*
Циклы for-in
*/

// Цикл for-in используется для перебора элементов последовательности

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}

// stride(from:to:by:); from - начальное значение, to - максимальное значение (не входит), by - шаг

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}

// stride(from:through:by:); from - начальное значение, to - максимальное значение (входит), by - шаг

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}

/*
Циклы while
*/

// while проверяет условие в начале каждой итерации.

while <#condition#> {
   <#statements#>
}

// repeat-while проверяет условие в конце каждой итерации.

repeat {
   <#statements#>
} while <#condition#>

/* 
Условие if-else
*/

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

let temperatureInCelsius = 25
let weatherAdvice: String

// Установка значений

if temperatureInCelsius <= 0 {
    weatherAdvice = "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    weatherAdvice = "It's really warm. Don't forget to wear sunscreen."
} else {
    weatherAdvice = "It's not that cold. Wear a T-shirt."
}
print(weatherAdvice)

let weatherAdvice = if temperatureInCelsius <= 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    "It's really warm. Don't forget to wear sunscreen."
} else {
    "It's not that cold. Wear a T-shirt."
}
print(weatherAdvice)

let freezeWarning: String? = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil
}

let freezeWarning = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil as String?
}

// и различные другие варианты выполнения кода

/*
Переключатель switch-case
*/

switch <#some value to consider#> {
case <#value 1#>:
    <#respond to value 1#>
case <#value 2#>,
    <#value 3#>:
    <#respond to value 2 or 3#>
default:
    <#otherwise, do something else#>
}

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

/*
Операторы передачи управления
*/

// continue - сообщает циклу, что нужно прекратить выполнение и перейти к следующей итерации.

// break - немедленно завершает выполнение всего оператора управления (цикл, switch). 

// fallthrough, return, throw

/*
Помеченные операторы
*/

// В Swift вы можете вкладывать циклы и условные операторы в другие циклы и условные операторы, 
// чтобы создавать сложные структуры управления. 

<#label name#>: while <#condition#> {
   <#statements#>
}

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}

/*
Ранний Выход
*/

// Оператор guard так же, как и оператор if, выполняет операторы в зависимости от логического значения выражения. 
// Оператор guard используется для того, чтобы код после оператора guard выполнялся только в том случае, 
// если условие истинно. В отличие от оператора if, 
// оператор guard всегда содержит предложение else — код внутри предложения else выполняется, если условие ложно.

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

/*
Отложенные Действия
*/

// В отличие от конструкций управления потоком, таких как if и while, defer управляет временем выполнения части кода. 
// Вы используете блок defer для написания кода, который будет выполняться позже, когда ваша программа достигнет конца 
// текущей области видимости.

var score = 1
if score < 10 {
    defer {
        print(score)
    }
    score += 5
}
// Prints "6"

// В приведённом выше примере код внутри блока defer выполняется до выхода из тела оператора if. 
// Сначала выполняется код в операторе if, который увеличивает score на пять. 
// Затем, перед выходом из области видимости оператора if, выполняется отложенный код, который выводит score.

// Код внутри defer всегда выполняется, независимо от того, как программа выходит из этой области видимости.

// Из-за ошибки во время выполнения или сбоя — отложенный код не выполняется.

// Если вы напишете более одного блока defer в одной области видимости, 
// то они будут выполняться от последнего к первому.

if score < 10 {
    defer {
        print(score)
    }
    defer {
        print("The score is:")
    }
    score += 5
}
// Prints "The score is:"
// Prints "6"

/*
Проверка доступности API
*/

// В Swift есть встроенная поддержка проверки доступности API, которая гарантирует, 
// что вы случайно не воспользуетесь API, недоступными в конкретной среде развёртывания.

if #available(<#platform name#> <#version#>, <#...#>, *) {
    <#statements to execute if the APIs are available#>
} else {
    <#fallback statements to execute if the APIs are unavailable#>
}

if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}

// Когда вы используете условие доступности с оператором guard, 
// оно уточняет информацию о доступности, которая используется в остальной части кода в этом блоке кода.

@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
       return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}

// В приведённом выше примере структура ColorPreference требует macOS 10.12 или более поздней версии.

if #available(iOS 10, *) {
} else {
    // Fallback code
}

if #unavailable(iOS 10) {
    // Fallback code
}

// Использование формы #unavailable помогает сделать код более читаемым, когда проверка содержит только резервный код.
