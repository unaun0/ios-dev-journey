// ex.4.1
// if

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 80 {
        teamScore += 3
    } else if score > 50 {
        teamScore += 2
    } else {
        teamScore += 1
    }
}
print(teamScore)

// ex.4.2.1

var optionalString1: String? = "Hello"
print(optionalString1 == nil)

// ex.4.2.2

var optionalString2: String? = nil
print(optionalString2 == nil)

// ex.4.3.1

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)

// ex.4.3.2

optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello!"
}
print(greeting)

// ex.4.4.1

let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi, \(nickname ?? fullName)"
print(informalGreeting)

// ex.4.4.2

if let nickname {
    print("Hey, \(nickname)")
} else {
    print("Hey, stranger!")
}

// ex.4.5
// switch

let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
}
// switch must be exhaustive, meaning every possible case must be handled.

// ex.4.6

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// ex.4.7

var n = 2
while n < 100 {
    n *= 2
}
print(n)

// ex.4.8

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// ex.4.9

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

// ex.4.10.1

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))
// print(greet("Bob", "Tuesday")) error

// ex.4.10.2

func greet_2(p person: String, d day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet_2(p: "Bob", d: "Tuesday"))

// ex.4.10.3

func greet_3(_ person: String, _ day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet_3("Bob", "Tuesday"))

// ex.4.11

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum, statistics.2)
print(statistics)

// ex.4.12

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
print(returnFifteen())

// ex.4.13

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))

// ex.4.14

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 0, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))

