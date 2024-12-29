// ex.5.1.1

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))
// print(greet("Bob", "Tuesday")) error

// ex.5.1.2

func greet_2(p person: String, d day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet_2(p: "Bob", d: "Tuesday"))

// ex.5.1.3

func greet_3(_ person: String, _ day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet_3("Bob", "Tuesday"))

// ex.5.2

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

// ex.5.3

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
print(returnFifteen())

// ex.5.4

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))

// ex.5.5

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

// ex.5.6

var numbers_2 = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(numbers_2)

// ex.5.7

let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)